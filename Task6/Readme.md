# Task 6: Job Listing App with Real API

## Project Design Mockups

The following placeholder images represent the expected UI states. **Replace these with your own screenshots** taken from your chosen design source (Google Stitch or Figma) to match the 2x2 grid below.

<div align="center">
  <table>
    <tr>
      <td align="center" width="50%">
        <img src="https://placehold.co/400x800/EEE/333?text=Loading+State" alt="Loading State" width="300"/>
        <br><em>Loading / Shimmer State</em>
      </td>
      <td align="center" width="50%">
        <img src="https://placehold.co/400x800/EEE/333?text=Loaded+State" alt="Success State" width="300"/>
        <br><em>Success State (Job List)</em>
      </td>
    </tr>
    <tr>
      <td align="center" width="50%">
        <img src="https://placehold.co/400x800/EEE/333?text=Empty+State" alt="Empty State" width="300"/>
        <br><em>Empty State (No jobs found)</em>
      </td>
      <td align="center" width="50%">
        <img src="https://placehold.co/400x800/EEE/333?text=Error+State" alt="Failure State" width="300"/>
        <br><em>Failure State (API Error)</em>
      </td>
    </tr>
  </table>
</div>

---

**Goal:** Build a Job Listing application in Flutter that fetches real data from a public API. The app must implement the **Cubit pattern** for state management.

**Design Source:**

- The UI must match the provided mockups/images. The intended design source is **[Google Stitch (stitch.withgoogle.com)](https://stitch.withgoogle.com/)** or a custom design from **Figma**.
- Focus on clean card layouts, rounded corners, and typography.

**API Endpoint:**

- `GET https://www.arbeitnow.com/api/job-board-api`
- This returns a list of job postings with details like `title`, `company_name`, `location`, `url`, and `created_at`.

**Key Note:**

- Do not write dummy data. Use the API strictly for loading data.
- Architecture must remain modular, following the same structure as Task 5.

## Project Structure & Architecture

Based on best practices and the previous task's structure, your project must follow this folder structure:

```text
lib/
├── core/
│   └── widgets/           # Shared widgets (Buttons, AppBar, etc.)
├── features/
│   └── jobs/
│       ├── data/
│       │   ├── models/
│       │   │   ├── job_model.dart  <-- JSON parsing
│       └── presentation/
│           ├── cubit/
│           │   ├── jobs_cubit.dart
│           │   └── jobs_state.dart
│           └── screens/
│               ├── jobs_screen.dart
│               └── widgets/
│                   ├── job_shimmer.dart
│                   └── job_card.dart
```

## 1. Data Layer: Models & API

### A. Model: `job_model.dart`

Create a `Job` class to represent the JSON response from the API.

- Fields: `id` (String), `title` (String), `companyName` (String), `location` (String), `url` (String), `createdAt` (DateTime).
- Include a `factory Job.fromJson(Map<String, dynamic> json)` method to parse the API response.

### B. Model: `job_response.dart`

Create a wrapper class `JobResponse` to handle the root JSON array.

- Field: `List<Job> jobs`.
- `factory JobResponse.fromJson(Map<String, dynamic> json)`.

### C. Data Source: `job_remote_data_source.dart`

- Use the `http` package.
- Create a class `JobRemoteDataSource` with a method: `Future<JobResponse> fetchJobs()`.
- The method must hit the URL `https://www.arbeitnow.com/api/job-board-api` and parse the response using the models defined above.

### D. Repository: `job_repository.dart`

Create an abstract repository class for dependency injection.

```dart
abstract class JobRepository {
  Future<List<Job>> getJobs();
}
```

Implement the concrete class `JobRepositoryImpl` that calls the `JobRemoteDataSource` and returns the list of jobs.

---

## 2. State Management: `jobs_state.dart`

Implement a sealed class `JobsState` with 4 subclasses to handle the UI states:

1.  `JobsInitialState`
2.  `JobsLoadingState`
3.  `JobsLoadedState` (Contains a required `List<Job> jobs` field)
4.  `JobsFailureState` (Contains a required `String errorMessage` field)

---

## 3. Business Logic: `jobs_cubit.dart`

- Create a `JobsCubit` that extends `Cubit<JobsState>`.
- Inject the `JobRepository` into the constructor.
- **Method:** `Future<void> loadJobs()`
  - **Step 1:** Emit `JobsLoadingState()`.
  - **Step 2:** Wrap the logic in a `try-catch` block.
  - **Try:** Call `await _repository.getJobs()`. If the list is empty, emit `JobsLoadedState(jobs: [])`. If populated, emit `JobsLoadedState(jobs: jobs)`.
  - **Catch (Exception e):** Emit `JobsFailureState(errorMessage: 'Failed to load jobs. Check your internet connection.')`.

---

## 4. UI Implementation: `jobs_screen.dart`

Create a `_JobsScreenState` widget that uses `BlocBuilder<JobsCubit, JobsState>` inside a `Scaffold`.

- **`initState` override:** Call `context.read<JobsCubit>().loadJobs();`.
- **`build` method:** Switch over the state:
  - `JobsLoadingState`: Return `JobShimmer()`.
  - `JobsLoadedState`: If empty, return a custom `EmptyStateWidget()` (Icon + "No jobs found"). If populated, return a `ListView.separated` rendering `JobCard()` widgets.
  - `JobsFailureState`: Return a `ErrorStateWidget()` with a "Retry" button that calls `context.read<JobsCubit>().loadJobs();`.

---

## 5. Custom UI Widgets

### A. `JobShimmer` Widget:

Create a list with 4 placeholder cards. Use `Shimmer.fromColors` with `baseColor: Colors.grey.shade300`, and `highlightColor: Colors.grey.shade100`.

- Use a container with rounded corners (Radius 16) and a height of ~120px.

### B. `JobCard` Widget:

This is the main visual piece. Design this based on your Stitch/Figma mockup.

- **Card** layout.
- **Top Row:** `company_name` (Bold, Primary Color) and `created_at` (Formatted to "2 days ago", Grey).
- **Middle:** `title` (Heading, large text) and `location` (Icon + Text).
- **Bottom Row:** An "Apply" button (Outlined style, leading to the `url` link) and `job_type` if available.
- Ensure proper padding and spacing (`16px` usually).

### C. `EmptyStateWidget`:

- A centered Column with an `Icon(Icons.search_off, size: 72)`, and text "No jobs found at the moment."

### D. `ErrorStateWidget`:

- A centered Column with an `Icon(Icons.wifi_off, size: 72)`.
- Text "Oops! Something went wrong."
- A `FilledButton` that triggers `loadJobs()`.
