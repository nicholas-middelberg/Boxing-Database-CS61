<a name="readme-top"></a>
  <h3 align="center"> Boxing Database and Predictive Modeling</h3>

  <p align="center">
    <br />
    <a href="https://github.com/nicholas-middelberg/Boxing-Database-CS61"><strong>Explore the docs »</strong></a>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a>
    <li><a href="#problem-statement">Problem Statement</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

The aim of this project is to analyze different boxer attributes leading to a decision in a boxing match, and to predict the outcome of matches given a set of attributes. Data cleaning was done in Python, database implementation in MySQL, and predictive modeling in MindsDB. Two boxing datasets containing data on fighters and popular bouts were downloaded from Kaggle. The data included in these datasets was originally scraped from [https://boxstat.co/](boxstat.co). Further documentation can be found on the [Github wiki](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki) for this project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- PROBLEM STATEMENT -->
## Problem Statement

As almost any boxing fan will tell you, predicting who will win a fight is an essential conversation to have with friends before any upcoming bout. Yet, most of the time, these debates are argued not with logic but opinion, one formed on nostalgia, favoritism, patriotism, and countless other biases. This bias even carries over into hypothetical bouts between both current and retired fighters. So can we reliably predict the outcome of a fight? Sports betting odds seem to operate off of some formula to predict who will win, but even they are wrong sometimes. Are there certain fighter traits that we can use to determine who will win, such as age, reach, height, experience, stance, and knockout power? Can we determine which of those traits have a greater impact on the outcome? The following project endeavors to answer this question, by first inserting a boxing dataset found on Kaggle (which is originally scraped from website boxstat.co) into a database in MySQL. Then using MindsDB, ML models are trained on the MySQL database using SELECT statements.

<p align="right">(<a href="#readme-top">back to top</a>)</p>




<!-- BUILT WITH -->
## Built With

![image](https://github.com/nicholas-middelberg/Boxing-Database-CS61/assets/102709066/51a84dc3-a808-4886-a071-d476cba9a098)








![image](https://github.com/nicholas-middelberg/Boxing-Database-CS61/assets/102709066/454d4965-54c7-48cd-bc64-35f5f44e39c3)





![image](https://github.com/nicholas-middelberg/Boxing-Database-CS61/assets/102709066/167ad5a6-5c3a-4498-b241-d5988be13f29)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

Database Design
- [Database Build Plan](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Database-Build-Plan)
- [Entity Relationship Diagram](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Entity-Relationship-Diagram)

Database Implementation
- [Data Cleaning](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Data-Cleaning)
- [Database Construction](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Database-Construction)
- [Data Importation](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Data-Importation)

Predictive Modeling
- [Research On ML Models](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Research-on-ML-models)
- [Installing MindsDB Locally](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Installing-MindsDB-Locally)
- [Establishing Connection to MySQL Server on MindsDB](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Establishing-Connection-to-MySQL-server-on-MindsDB)
- [Creating and Querying Model](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Creating-and-Querying-Model)

Sample Queries
- [Sample Query 1](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Sample-Query-1)
- [Sample Query 2](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Sample-Query-2)
- [Sample Query 3](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Sample-Query-3)
- [Sample Query 4](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Sample-Query-4)
- [Key Takeaways From Modeling](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki/Key-Takeaways-From-Modeling)
<p align="right">(<a href="#readme-top">back to top</a>)</p>




<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [README template](https://github.com/othneildrew/Best-README-Template/tree/master)
* [Kaggle Boxing Dataset](https://www.kaggle.com/datasets/iyadelwy/boxing-matches-dataset-predict-winner?select=fighters.csv)
* [Boxing Data Website](https://boxstat.co/)
* [Machine Learning Article](https://www.infoworld.com/article/3607762/10-databases-supporting-in-database-machine-learning.html)
* [MindsDB website](https://docs.mindsdb.com/what-is-mindsdb)
* [Tutorial Generating Models with MindsDB using PHP and MySQL](https://techsch.com/tutorials/mindsdb-machine-learning-mysql-tables-php)
* [Recording of Workshop Hosted by MindsDB](https://mindsdb.com/events/hands-on-workshop-effective-machine-learning-inside-your-database)
* [Github for Project Prediction of Absenteeism at Work](https://github.com/palashck/Prediction-of-Absenteeism-at-work)


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 
