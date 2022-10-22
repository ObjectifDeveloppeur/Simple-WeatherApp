# Simple-WeatherApp

A weather application is a good project to practice code and architecture principles and techniques.

The application is developed in Swift with **SwiftUI**.

The weather data is retrieved from the Apple **WeatherKit** Framework.

As the latter does not provide the air quality index, we will retrieve the information from the **"Open Weather Map" API**.
(https://openweathermap.org/api/air-pollution)

You will find in the code a **generic Networker** that you can use as you wish in your applications.

To manage asynchronous tasks **Swift Concurrency** is used.

This project uses an **MVVM** architecture with **dependency injections**.

