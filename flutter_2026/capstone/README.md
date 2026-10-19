# Mobile App Development Capstone: Expectations & Guidelines

Updated 19 October 2026

## Overview

The capstone is a group project worth **40% of the final exam**. Each group of three designs and builds a working mobile app in Flutter with its own backend, and shows both running together on **23 November 2026**.

Real apps are two programs talking to each other: the app on the phone and a server with a database behind it. This project makes you practise the whole chain:

- Analyse a real problem and write down what the system must do
- Design a database with an ERD
- Build a REST API
- Build the Flutter app that uses it
- Work as a team in Git

You choose your own idea. Pick something that matters to people on campus or at home.

## Project ideas

Pick one of these or bring your own. Your own idea is welcome if it meets the requirements below (users with login, at least 4 tables, full create, read, update and delete) and I approve it by **Wednesday 21 October**.

| Idea | What it does | Example tables |
| --- | --- | --- |
| Zakat and savings tracker | Calculates zakat and tracks savings goals and payments | Users, Assets, Payments, Goals |
| Ramadan planner | Logs fasting, Quran pages read and taraweeh | Users, Days, QuranProgress, Goals |
| Dhikr and tasbih counter | Daily dhikr goals, counts and history | Users, Dhikr, Sessions, Goals |
| Halal food finder | Lists places to eat around campus with reviews | Users, Restaurants, Categories, Reviews |
| Timetable and assignments | Lectures, deadlines and reminders for a student | Users, Courses, Lectures, Assignments |
| Mobile money expense tracker | Tracks spending in UGX by category | Users, Accounts, Transactions, Categories |
| Student marketplace | Students list and buy books and other items | Users, Items, Categories, Orders |
| Islamic studies quiz | Quizzes with a leaderboard served from the backend | Users, Questions, Quizzes, Attempts |

## Groups and roles

Every group has **exactly three members**, chosen by Wednesday 21 October. Each member owns one area but everyone writes code and commits to Git.

| Role | Owns | Also expected to |
| --- | --- | --- |
| Backend lead | API, database, run instructions | Review the app's API calls |
| Flutter lead | Screens, navigation, forms | Review the backend's responses |
| Analyst and integration lead | System analysis, ERD, API docs, testing, README | Write code in both parts |

Roles decide who is responsible for what, not who is excused from learning it. In the demo, any member may be asked about any part.

## What you must build

These are the **minimum** requirements. A project that misses any of them cannot earn full marks for that component.

**Backend**

- A REST API that returns JSON over HTTP
- A relational database (SQLite, PostgreSQL or MySQL) that matches your ERD
- At least 4 tables (one of them users), with full create, read, update and delete on at least 2 of them
- At least one one-to-many relationship, implemented with a foreign key
- Input validation and correct status codes (200, 201, 400, 404)
- API documentation: Swagger/OpenAPI or a Postman collection

**Flutter app**

- At least 4 screens with navigation between them
- All data comes from your backend, with no hard-coded lists
- The user can create, view, edit and delete records from the app
- Loading and error states, including what the user sees when the server is off
- Form validation
- Code organised into `models/`, `services/`, `screens/` and `widgets/`, as in class

**Authentication (required in every app)**

- Users can register and log in, and the app has a login screen
- Passwords are stored hashed (for example with bcrypt), never as plain text
- The API gives the app a token at login (JWT or a session token), and the app sends it with every request
- Protected endpoints return 401 when the token is missing or invalid
- At least one resource belongs to a user, and each user sees only their own records
- Logging out clears the token from the phone
- Your ERD includes a users table

**Bonus (optional)**

- User roles (for example admin and member), search or filter, saving data on the phone for offline use, or a deployed server

## System analysis and ERD

Before writing code, each group submits a **design document** (PDF, saved in the `docs/` folder of your repository) by **Saturday 24 October**. Your database must later match your ERD exactly.

The document contains:

1. **Problem statement** (half a page): who has the problem and how your app helps
2. **Users and their goals**: who uses the system and what each wants to do
3. **Requirements**: at least 10 functional requirements written as "The system shall...", and at least 3 non-functional ones (for example, the app must stay usable on a slow connection)
4. **Use case diagram**, or at least 8 user stories
5. **ERD**: at least 4 entities (one of them users), each with attributes and data types, primary keys, foreign keys and the cardinality of every relationship (1:1, 1:N). Resolve many-to-many relationships with a junction table. Normalise to third normal form.
6. **Data dictionary**: for each entity, a table of field, type, size, constraints and meaning
7. **API endpoint table**: method, path, purpose, request body and response
8. **Screen sketches** of your main screens (paper photos or Figma are both fine)

Tools for the diagrams: draw.io, dbdiagram.io or Lucidchart. A neat hand drawing, photographed clearly, is also accepted.

## Backend technology

Use any backend stack your group can finish. I recommend **FastAPI**, which we build in class, so you get the most help with it.

| Stack | Language | Notes |
| --- | --- | --- |
| FastAPI (recommended) | Python | Taught in class; automatic API docs at `/docs` |
| Django with Django REST Framework | Python | Built-in admin and ORM; more setup |
| ASP.NET Core Web API | C# | Strong typing; heavier tooling |
| Node.js with Express | JavaScript | Flexible; you choose the structure |
| Laravel | PHP | Full-featured; includes migrations |

Whichever stack you pick:

- It must be **your own backend**. Firebase, Supabase and similar services cannot replace it.
- It must return JSON over HTTP and run on a laptop with the steps written in your README.
- Only FastAPI is taught in class. If you choose another stack, your group must be able to learn and debug it independently.

## Milestones

The backend must be running by 8 November, which leaves two weeks to connect the app and polish before the demo.

| Date (2026) | Checkpoint |
| --- | --- |
| Wed 21 October | Groups chosen, idea approved, repository created |
| Sat 24 October | Design document submitted (analysis, ERD, endpoint table) |
| Sun 8 November | Backend running with core endpoints and login |
| Sun 15 November | Flutter app connected to the backend, full create, read, update and delete working |
| Fri 20 November | Final code pushed (code freeze) |
| Mon 23 November | Demo day |

## Demo and submission

Submit one GitHub repository link per group by **Friday 20 November**. After that date, no more commits count.

The repository contains:

- `backend/`: the API, with a README listing the exact steps to run it
- `app/`: the Flutter project
- `docs/`: the design document, ERD image and API documentation
- A top-level README with the group's names, the project idea and screenshots

The demo is on **Monday 23 November** and lasts about 10 minutes:

1. A one-minute pitch of the problem and the solution
2. A live demo with the server running and the app on a phone or emulator, showing register, login, create, view, edit and delete
3. Your ERD next to the real database tables
4. Questions: each member answers at least one question about the code

Start the server and the app before your turn, and keep a short screen recording as a backup in case the network fails.

## Grading rubric

The capstone is marked out of 100, and that mark counts for **40% of the final exam**. For example, a group mark of 80 contributes 32 of those 40 points.

| Component | Marks | What I look for |
| --- | --- | --- |
| System analysis and ERD | 20 | Clear problem, complete requirements, correct and normalised ERD, endpoint table |
| Backend | 25 | Working API, database matches the ERD, authentication, validation, status codes, documentation |
| Flutter app | 25 | Login and logout, four or more screens, full CRUD, loading and error states, clean code structure |
| Integration and demo | 15 | App and server work together live, clear pitch, good answers to questions |
| Git and teamwork | 15 | Regular commits from all three members, clear messages, working README |

Marks can differ between members. Your Git history and your answers in the demo are used to adjust each person's mark from the group mark.

## Ground rules

- **Everyone commits.** Commit at least weekly, with messages that say what changed. Git history is the evidence of who contributed.
- **One repository per group**, created by Wednesday 21 October, with all three members added.
- **Use AI tools to learn, not to replace learning.** You may use them to explain errors or ideas, but you must be able to explain every line you submit. Demo questions will check this.
- **Your work only.** Copying another group's project or code earns zero for the affected component.
- **Ask early.** Bring blockers to class or message me as soon as you are stuck, not the night before a deadline.
