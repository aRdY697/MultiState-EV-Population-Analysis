**"Please unzip EV_cleaned.zip to access the dataset."**

🚗 Electric Vehicle (EV) Population & Market Analysis
📌 Project Overview
This project provides a comprehensive analysis of the Electric Vehicle (EV) landscape across multiple states. By processing a dataset of over 268,000 registrations, the study uncovers regional adoption patterns, manufacturer performance, and technological advancements in battery range. The analysis is designed to scale across different geographic regions, providing a template for national EV market research.

🛠️ Tech Stack & Workflow
Data Processing: Python (Pandas, NumPy) for cleaning, handling missing geographic data, and deduplication.

Statistical Analysis: SQL for market share calculations, range segmentation, and performance benchmarking.

Visual Intelligence: Matplotlib & Seaborn for identifying registration hotspots and manufacturer dominance.

📂 Key Components
EV_cleaned.csv: The master dataset containing vehicle specs (Make, Model, Year, Range) and geographic data (State, County, City, Postal Code).

python_query.pdf: Detailed documentation of the data cleaning pipeline and exploratory visualizations.

EV_Analysis_Queries.rtf: A comprehensive suite of SQL queries designed to extract business-critical insights across different states and cities.

📈 Analytical Highlights
1. Geographic Distribution
State & Regional Analysis: Evaluates EV adoption rates across different states to identify high-growth regions.

City-Level Benchmarking: Identifies top-performing cities based on the volume of Battery Electric Vehicles (BEVs) and average battery range.

2. Market Segmentation
Vehicle Types: A deep dive into the market share of Battery Electric Vehicles (BEVs) vs. Plug-in Hybrid Electric Vehicles (PHEVs).

Range Categories: Using SQL CASE logic to segment the market into:

Short Range: (<100 miles)

Mid Range: (100–250 miles)

Long Range: (>250 miles) — Identifying the shift toward high-capacity battery tech.

3. Manufacturer Performance
Brand Rankings: Analysis of top-selling manufacturers (Tesla, Chevrolet, Ford, etc.) and their specific model performance.

Technology Leaders: Ranking brands based on their average electric range to determine which manufacturers lead in battery efficiency.

🚀 How to Execute
Data Setup: Import the EV_cleaned.csv into your environment.

Run Python Notebook: Follow the steps in jupyter notebook to visualize registration trends and clean any new data entries.

SQL Deep-Dive: Execute the scripts in MS SQL Server to generate tabular reports on market share, city rankings, and range distributions.

Project by: [Rohan Debnath]

Objective: To provide actionable insights into the evolving electric mobility sector through multi-state data analysis.
