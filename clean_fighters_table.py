import pandas as pd

##########define functions to split fighter names############
def get_last_name(x):
    if 'jr' in x[len(x)-1]:
        last = x[len(x)-2]
    else:
        last = x[len(x)-1]
    return last

def get_middle_name(x):
    if 'jr' not in x[len(x)-1] and len(x) == 3:
        return x[1]
    else:
        return pd.NA

def get_surname(x):
    if 'jr' in x[len(x)-1]:
        return x[len(x)-1]
    else:
        return pd.NA


##########import and fighter and fights tables############
fighter_df = pd.read_csv ('fighters.csv') #read in fighters csv
fights_df = pd.read_csv('popular_matches.csv') #read in fights csv


##########rename columns and drop irrelevant data############
fighter_df = fighter_df.rename(columns={'looses': 'losses'}) #rename typo in losses column
fighter_df = fighter_df.rename(columns={'age': 'age_2022'}) #rename age to describe the value stored in the column more accurately

fighter_df = fighter_df[(fighter_df['wins'] != 0) | (fighter_df['losses'] != 0) | (fighter_df['draws'] != 0)] #remove fighters with no fighting record (uninteresting)
fights_df = fights_df.drop(columns='place') #this is not interesting(also scraped data just has 'Unknown' here for some reason


##########delete entries in fights table where at least one fighter not in fighter table############
fighter_df['name'] = fighter_df['name'].str.lower() #normalize all names to lowercase
fights_df['opponent_1'] = fights_df['opponent_1'].str.lower()
fights_df['opponent_1'] = fights_df['opponent_1'].str.strip() #since original file has a trailing whitespace which throws off .isin()
fights_df['opponent_2'] = fights_df['opponent_2'].str.lower()

fights_df = fights_df[fights_df.opponent_1.isin(fighter_df.name) == True]
fights_df = fights_df[fights_df.opponent_2.isin(fighter_df.name) == True]


##########split date, verdict, and name fields############
#split date of fight into 3 fields
fights_df['day'] = fights_df['date'].str.split(' ').apply(lambda x: x[0])
fights_df['month'] = fights_df['date'].str.split(' ').apply(lambda x: x[1])
fights_df['year'] = fights_df['date'].str.split(' ').apply(lambda x: x[2])

#split name in fighter table into four fields
fighter_df['first_name'] = fighter_df['name'].str.split(' ').apply(lambda x: x[0])
fighter_df['last_name'] = fighter_df['name'].str.split(' ').apply(lambda x: get_last_name(x))
fighter_df['middle_name'] = fighter_df['name'].str.split(' ').apply(lambda x: get_middle_name(x))
fighter_df['surname'] = fighter_df['name'].str.split(' ').apply(lambda x: get_surname(x))

#split names of fighters in fights table into three fields
fights_df['op1_first_name'] = fights_df['opponent_1'].str.split(' ').apply(lambda x: x[0])
fights_df['op1_last_name'] = fights_df['opponent_1'].str.split(' ').apply(lambda x: get_last_name(x))
fights_df['op1_middle_name'] = fights_df['opponent_1'].str.split(' ').apply(lambda x: get_middle_name(x))
fights_df['op1_surname'] = fights_df['opponent_1'].str.split(' ').apply(lambda  x: get_surname(x))
fights_df['op2_first_name'] = fights_df['opponent_2'].str.split(' ').apply(lambda x: x[0])
fights_df['op2_last_name'] = fights_df['opponent_2'].str.split(' ').apply(lambda x: get_last_name(x))
fights_df['op2_middle_name'] = fights_df['opponent_2'].str.split(' ').apply(lambda x: get_middle_name(x))
fights_df['op1_surname'] = fights_df['opponent_2'].str.split(' ').apply(lambda  x: get_surname(x))

#split verdict field in fights table
fights_df['winner'] = fights_df['verdict'].str.split(' ').apply(lambda x: x[0]).str.lower()
fights_df['decision'] = fights_df['verdict'].str.split(' ').apply(lambda x: x[2] if 6 == len(x) else x[3] if 7 ==len(x) else x[4])
fights_df['round'] = fights_df['verdict'].str.split(' ').apply(lambda x: x[5] if 6 == len(x) else x[6] if 7 == len(x) else x[7])

##########replace winner name field with opponent number############
fights_df.loc[(fights_df['winner'] == fights_df['op1_last_name']), 'winner'] = 'op_1'
fights_df.loc[(fights_df['winner'] == fights_df['op2_last_name']), 'winner'] = 'op_2'

#remove symbols from height, reach, and ko_rate columns for importation into MySQL and write NULL values into missing spaces in the csv"
fighter_df['height'] = fighter_df['height'].str.extract(r'\(([\d.]+) m\)')
fighter_df['reach'] = fighter_df['reach'].str.extract(r'\(([\d.]+) cm\)')
fighter_df['ko_rate'] = fighter_df['ko_rate'].str.replace('%', '')
fighter_df.replace(pd.NA, 'NULL', inplace=True)
fighter_df.replace('Unknown', 'NULL', inplace=True)
fights_df.replace(pd.NA, 'NULL', inplace=True)


with pd.option_context('display.max_rows', None,
                       'display.max_columns', None,
                       'display.precision', 3,
                       ):
    print(fighter_df[['first_name','height', 'reach']])
    print(fights_df[['winner']])

fighter_df.to_csv('fighters_clean.csv')
fights_df.to_csv('fights_clean.csv')
