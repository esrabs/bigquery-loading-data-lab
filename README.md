<h1>BigQuery – Loading and Transforming NYC Taxi Data</h1>

<p>
  This project demonstrates how to ingest, transform, and analyze structured data using
  <strong>Google BigQuery</strong>. I created a dataset, loaded NYC Taxi trip data from both CSV files
  and Google Cloud Storage, executed SQL queries, and used DDL to generate new tables.
  This project highlights essential data engineering skills in cloud-based data warehousing.
</p>

<h2>Objectives</h2>
<ul>
  <li>Create and manage datasets in BigQuery</li>
  <li>Load data from CSV files using both the Console and the <code>bq</code> CLI</li>
  <li>Use SQL DDL to create new tables</li>
  <li>Run analytical SQL queries on real-world data</li>
  <li>Understand data ingestion workflows in BigQuery</li>
</ul>

<h2>Project Workflow</h2>

<h3>1. Create a BigQuery Dataset</h3>
<p>
  A dataset named <code>nyctaxi</code> was created to store all project tables.
</p>

<h3>2. Load a CSV File Using the BigQuery Console</h3>
<p>
  I uploaded a local CSV file containing NYC Taxi trip data and created the table
  <code>nyctaxi.2018trips</code>. BigQuery detected and applied the schema automatically.
</p>

<h3>3. Load Additional Data Using the CLI</h3>
<p>
  I appended a second CSV file stored in Google Cloud Storage using the <code>bq load</code> command:
</p>

<pre><code>bq load \
  --source_format=CSV \
  --autodetect \
  --noreplace \
  nyctaxi.2018trips \
  gs://cloud-training/OCBL013/nyc_tlc_yellow_trips_2018_subset_2.csv
</code></pre>

<p>
  After the load job completed, the number of rows in <code>nyctaxi.2018trips</code> increased as expected.
</p>

<h3>4. Run Analytical SQL Queries</h3>
<p>Example: Top 5 most expensive trips of 2018:</p>

<pre><code>SELECT *
FROM nyctaxi.2018trips
ORDER BY fare_amount DESC
LIMIT 5;
</code></pre>

<h3>5. Create a New Table Using SQL DDL</h3>
<p>
  I created a table containing only January trips:
</p>

<pre><code>CREATE TABLE nyctaxi.january_trips AS
SELECT *
FROM nyctaxi.2018trips
WHERE EXTRACT(MONTH FROM pickup_datetime) = 1;
</code></pre>

<p>Then I queried the longest January trip:</p>

<pre><code>SELECT *
FROM nyctaxi.january_trips
ORDER BY trip_distance DESC
LIMIT 1;
</code></pre>

<h2>Insights</h2>
<ul>
  <li>Multiple ingestion paths (Console + CLI) for the same dataset</li>
  <li>Automated schema detection simplifies loading structured data</li>
  <li>SQL can be used for both transformation and analysis in BigQuery</li>
  <li>Derived tables can be created efficiently using DDL</li>
  <li>Reinforced understanding of the BigQuery hierarchy (project → dataset → table)</li>
</ul>

<h2>Tools &amp; Technologies</h2>
<ul>
  <li>Google BigQuery</li>
  <li>BigQuery SQL</li>
  <li>Google Cloud Storage</li>
  <li>Cloud Shell</li>
  <li><code>bq</code> CLI</li>
</ul>

