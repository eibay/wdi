# Project Four

---

**<span style="color:darkblue">Build a complex full stack application using Ruby on Rails </span>**

1. This application will have a **client-based** component as well as a **server-side** component.

## Format

Thus far in class, we have done both individual projects and group projects. Now it is up to you to choose how you want tackle this last project. Students can work individually or in a group of 2. No more than two people per group will be permitted.

## Outline

The period dedicated to projects in-class begins the morning of Friday, October 24. **On Thursday, October 30, we will be doing presentations to demo the progress we have made**.

As with the previous project, we will meet at 9:30 am during the project period. The only exception is on Friday, Oct 24 where we will be doing a joint activity with the PMI students, so please be here at 9am.

The dedicated project period is known as a ***sprint***. During this sprint, we will have daily ***stand-ups***, or short meetings with our classmates and instructors, every morning. The purpose of the stand-up is to set goals for the day and support one-another in our development tasks. The purpose of the sprint is to fulfill a set of required features known as an ***MVP***, or *minimum viable product*.

**The end of the sprint is not the end of the project**.

**Each student/group will be responsible for their own project**. This means that every student must be able to explain what every piece of code does. Do not include code you do not understand!

## Objectives

- Pull together all the knowledge and experience of the last 12 weeks by building a web application from the ground up.
- Practice integrating topics covered during this course thus far, bridging the gaps between the various areas of a web app (client-side and server-side).
- Effectively use [GitHub](https://help.github.com/categories/63/articles) and [Trello](https://trello.com/).

## Core Requirements
- __Application__
    - A server-side component built using Ruby on Rails and Postgres that will act as a service to be consumed.
    - A client-side component that is a **Single Page Application** which will consume that API you built.
      - You can choose whether to use Backbone or to roll your own solution with Javascript/jQuery.
    - A user authentication scheme must be used.
      - Users should be able to log in and out.
      - As discussed in class, the auth scheme will exist outside of the SPA.
    - An external API must be consumed.
      - It is your choice whether you should interact with API using HTTParty or a gem on the server-side or whether you AJAX directly to it from the client-side.
      - Resources to research API's:
        - [Programmable Web](http://www.programmableweb.com/)
        - [Mashape](https://www.mashape.com/)
    - All of your routes should follow REST protocol
- __Deployment__
  - Your application **MUST** be hosted on Heroku or Digital Ocean.
  - Readme for Heroku Deployment can be found [here][heroku]
  - Readme for Digital Ocean Deployment can be found [here][digitalocean]
  - When presentation time comes around, you will be demo'ing the hosted version.
  - *Bonus*
    - Buy a domain name and have it hooked up to your Heroku or Digital Ocean deployment.
    - Place to buy domains
      - [GoDaddy](http://www.godaddy.com)
      - [Name.com](http://www.name.com)

## Deliverables (Due on Thursday, October 30th)

- The MVP of an application with a detailed README that features:
    - A short description of your Application
    - Team members
    - Technologies used
    - A link to your Trello board
    - Artifacts
      - Wireframes
      - ERDs
- A Github repo that holds your project.
  - If you are working in a group, be sure to create an organization just like you did during project three.
- A new [Trello board](https://trello.com/) that serves as a prioritized list of tasks your team needs to complete during your sprint. This includes user stories, bug fix, general todo.
- Lightning talk that:
    - Demo your application on Heroku or Digital Ocean.
    - You will be presenting this talk to the entire class


##Last Details
- [Timeline][timeline]

<!-- Links -->

[timeline]: timeline.md
[heroku]: ../../guides/rails_app_on_heroku.md
[digitalocean]: ../../guides/digital_ocean.md

##Final thoughts

**This is not a hack fest!** Cobbling or hacking together a bunch of code is not the point of this project. We want to write well structured, easy to read, and working code.

To this end, make sure you spend enough time planning your application and how you are going to implement it.

---
