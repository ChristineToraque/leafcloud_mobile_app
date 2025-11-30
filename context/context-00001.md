This is a much clearer and more robust architecture. In this model, your Raspberry Pi is the **Data Collector** and your Flutter App is the **Data Viewer** (the dashboard).

This is a classic IoT-to-App workflow and perfectly matches your conceptual framework diagram (Figure 6) ``. The app's job is to read and display the results that the Raspberry Pi and server have already created.

Based on this, your app will consume `GET` endpoints to fetch data from your server. Here are the definitions for the two primary endpoints your app will need.

---

### 1. Endpoint: Get Latest Readings (For your Dashboard)

This endpoint gets the single most recent data entry to display on your app's main dashboard. This is for the "at-a-glance" view.

* **Method:** `GET`
* **Endpoint:** `/api/v1/readings/latest`
* **Purpose:** To retrieve the last record created by your Raspberry Pi and CNN.

#### JSON Response Structure (Success):

This JSON is designed to provide everything your app needs to populate the dashboard screen, including the NPK values, the sensor data, the image that was used, and status flags for color-coding.


http://googleusercontent.com/immersive_entry_chip/0

**Field Explanations:**

* `timestamp`: The exact time the reading was taken (in ISO 8601 format).
* `lettuce_image_url`: The URL to the photo the Raspberry Pi took, so you can display it in the app.
* `sensors`: An object holding the raw sensor data that was fed into the model.
* `predictions`: An object holding the final NPK numbers from the CNN.
* `status`: Simple string codes. Your app can use these to set text colors (e.g., `low` = yellow/red, `ok` = green). This matches the "Color codes" you specified in your GUI design ``.
* `recommendation`: This directly fulfills your "Gives recommendation" use case `` and your "Recommendation" screen ``. Your backend server can generate this simple advice.

---

### 2. Endpoint: Get Historical Data (For your History Charts)

This endpoint gets an *array* of data from a specific time range to draw the line graphs on your "History" screen (``).

* **Method:** `GET`
* **Endpoint:** `/api/v1/readings/history?range=7d`
    * You would use query parameters like `range=24h`, `range=7d`, or `range=30d` to tell the server how much data you want.

#### JSON Response Structure (Success):

This JSON is designed to be lightweight. It's an array of data points optimized for drawing charts, so it only includes the timestamps and values.


http://googleusercontent.com/immersive_entry_chip/1

### Your Flutter App's Job

Now your task in Flutter is clear:

1.  **On App Load (Dashboard Screen):**
    * Call the `/api/v1/readings/latest` endpoint.
    * Parse the JSON response.
    * Use a `setState()` to update your UI widgets with the `n_ppm`, `ec`, `ph`, `recommendation`, etc.
    * Use the `status` fields to set your widget colors.

2.  **On History Screen:**
    * Call the `/api/v1/readings/history?range=7d` endpoint.
    * Parse the JSON response.
    * Use the `data_points` array to feed data into a Flutter `charts_flutter` package to build your line graphs.

I'll provide the Flutter app starter code next, which will include a "dummy" version of this UI and the code to fetch and parse this data.