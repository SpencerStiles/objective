Coding Test Instructions
========================

The purpose of this test is to determine your ability to learn quickly, analyze
problems, and produce logic to solve these problems. I will also be looking at
code readability and cleanliness.

In this tarball
---------------

You'll find a sample data set in three different forms, for your convenience.
Specifically, data.sqlite3 (sqlite3 database), data.sql (a MySQL database
dump), and data.json (a JSON object). Your solution only needs to read one of
these data sources.

This test set also includes example output in the form of an HTML page:
index.html.

Problem
-------

Your task is to use the data provided and implement some sort of application
(Ruby on Rails, Django, Laravel, React, node.js, your own custom application,
etc.) to output the data in a format that matches as closely as possible the
HTML structure shown in index.html (the actual HTML, not just how it looks when
rendered in the browser). Your solution must allow any number of skills per
person, any number of jobs, and any number of applicants. Your solution *must
not* use CSS styles to format the HTML, except for what is already provided in
the index.html example.

Please feel free to ask questions: sam@objective.dev

Additional Info
---------------

The following is a summary of the data provided.

#### Job

* Columns:
  * id: integer
  * name: string (e.g. Web Developer)

#### Applicant

* Columns:
  * id: integer
  * name: string
  * email: string
  * website: string
  * cover_letter: text
  * job_id: integer
* Relationships:
  * has one job
  * has many skills

#### Skill

* Columns:
  * id: integer
  * name: string
  * applicant_id: integer

