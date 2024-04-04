<h1> Aircraft delay analysis </h1>

An analysis of aicraft flight delays based on 3 factors:
- weather conditions
- aircraft condition
- route lenght

<h2> Objective </h2>
Basing on data provided by Kaggle [https://www.kaggle.com/datasets/threnjen/2019-airline-delays-and-cancellations], excute an analysis on aicraft delays, make insights that have business value and prepare a dashboard report for the BI department.

<h2> Notebook contents </h2>
<p></p>
<b>01_Pobieranie_danych </b>
 <li> Access data through a dedicated API with 4 endpoint: airport, weather, aicraft, flight.</li> 
 <li> Save them as raw data in csw </li>
 <p></p>
<b>02_Inicjowanie_bazy_danych</b>
  <li>Preparing a database schema in sql</li>
  <p></p>
<b>03_Populacja_bazy_danych</b>
  <li>Transfering raw data from notebook 01 to dedicated sql tables</li>
  <p></p>
<b>04_Analiza_danych_01</b>
  <li>Transfering data from sql to dataframe.</li>
  <li>Inital analysis and descriptive statistics of the 'delay' column, providing MatplotLib visualisations</li>
  <li>Deepened analysis: Delays vs month, delays vs day of the week, delay vs weekend, delay vs lenght of route,  delay vs. distance group</li>
  <p></p>
<b>05_Analiza_danych_02</b>
  <li>Cleaning aicraft data</li>
  <li>Deepened analysis: Delays vs aicraft year of production.</li>
  <p></p>
<b>06_Analiza_danych_03</b>
  <li>Cleaning weather and airport data</li>
  <li>Deepened analysis: top routes with biggest delays, top routes with smalest delays, delays vs snow, delays vs rainfall, delays vs max temperature</li>
  <li>MatplotLib visualisations</li>
  <p></p>
<b>07_Budowa_Schematu_reporting</b>
  <li>Preparing a reporting schema in sql</li>
  <p></p>
<b>08_Dashboard</b>
  <li>Preparing a dashboard in DASH with 3 components:
    <ul><li>`TOP report`
      <ul>
      <li>TOP 10 aicraft routes with the lowest delay ratio</li></ul></ul></li>
    <ul><li>`Comparision`
      <ul>
      <li> Comparison of 2019 and 2020 in the form of a graph bar</li>
        <ul>
        <li>- month to month</li>
        <li>- day of the week to day of the week</li></ul></ul></li></ul>
   <ul><li> `Day by day reliability`
     <ul>
      <li> Day by day in the form of a time series</li></ul></ul></li>
  
<h2> Used Libraries: </h2>
<ul>
  <li> <b>Pandas</b></li>
  <li> <b>Numpy</b></li>
  <li> <b>MatplotLib</b></li>
  <li> <b>psycopg2</b></li>
  <li> <b>sqlalchemy</b></li>

  <li> <b>plotly.express</b></li>
  <li> <b>dash</b></li>  
</ul>
