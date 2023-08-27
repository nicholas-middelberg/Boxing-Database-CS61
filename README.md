<a name="readme-top"></a>
  <h3 align="center"> Boxing Database and Predictive Modelling</h3>

  <p align="center">
    <br />
    <a href="https://github.com/othneildrew/Best-README-Template"><strong>Explore the docs »</strong></a>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a>
    <li><a href="#problem-statement">Problem Statement</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

The aim of this project is to analyze different boxer attributes leading to a decision in a boxing match, and to predict the outcome of matches given a set of attributes. Data cleaning was done in Python, database implementation in MySQL, and predictive modelling in MindsDB. Two boxing datasets containing data on fighters and popular bouts were downloaded from Kaggle. The data included in these datasets was originally scraped from [https://boxstat.co/[(boxstat.co). Further documentation can be found on the [Github wiki](https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki) for this project.

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

- 
<p align="right">(<a href="#readme-top">back to top</a>)</p>




<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
* [Malven's Grid Cheatsheet](https://grid.malven.co/)
* [Img Shields](https://shields.io)
* [GitHub Pages](https://pages.github.com)
* [Font Awesome](https://fontawesome.com)
* [React Icons](https://react-icons.github.io/react-icons/search)

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


# Boxing-Database-CS61

Project written in MySQL for Dartmouth CS61 in Summer 2023. Two boxing datasets containing data on fighters and popular bouts were downloaded from Kaggle. The data included in these datasets was scraped from https://boxstat.co/, which contains documentation explaining specific statistics. The schema was then designed, modeled, and implemented using mysql and python scripts. More documentation on steps can be found on the github wiki for this project: https://github.com/nicholas-middelberg/Boxing-Database-CS61/wiki
