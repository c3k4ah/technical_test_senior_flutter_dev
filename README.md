# Technical Test - Senior Flutter Developer

## Duration: ~4 hours

### Objective
Evaluate your technical skills, logic, and ability to design a maintainable and high-performance Flutter application.

---

## Context
You need to develop a small mobile application for personal task management. The application should allow:
1. [x] Creating, updating, and deleting tasks.
2. [x] Displaying tasks in a list view.
3. [x] Persisting data even after restarting the application.

---

## Functional Requirements

1. **Main Screen: Task List**
    - [x] Displays all tasks with their title and status (completed/not completed).
    - [x] Allows marking a task as completed or not.

2. **Task Creation/Editing Screen**
    - [x] Contains a field for the title and a checkbox for the status.
    - [x] Allows adding or modifying an existing task.

3. **Data Persistence**
    - [x] Tasks should be saved in a local database (SQLite, Hive, etc.).

---

## Technical Requirements

- [x] Use **Flutter Bloc** for state management.
- [x] Implement a **Clean Architecture** approach (domain, data, presentation).
- [x] Validate input fields (e.g., title should not be empty).
- [ ] Use **Dio** to simulate an API returning a pre-filled list of tasks when the app starts.
- [x] Write unit tests to validate business logic.


---

## Deliverables

- [x] Source code hosted on a Git repository (GitHub, GitLab, etc.).
- [x] Clear instructions on how to run the project.
- [x] Unit tests covering business rules.
- [ ] A document explaining the technical choices and architecture.
