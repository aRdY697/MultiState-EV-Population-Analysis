/*=============================================================================================
ELECTRIC VEHICLE POPULATION ANALYSIS
Project: EV Market Insights - Washington State
Author: [Your Name]
Date: 2024
===============================================================================================
*/

USE Project_5;

SELECT * FROM EV;

-- 1. MARKET OVERVIEW: Calculating the share of BEVs vs. PHEVs
SELECT
	electric_vehicle_type,
	COUNT(*) AS count,
	CAST(COUNT(*) * 100.0 /(SELECT COUNT(*) FROM EV) AS DECIMAL(10,2))percentage
FROM EV
GROUP BY electric_vehicle_type;

-- 2. GEOGRAPHIC INSIGHTS: Top 10 cities with the highest average electric range
-- Note: We filter for cities with >100 vehicles to ensure statistical relevance.
SELECT
	TOP 10
	city,
	CAST(AVG(electric_range) AS DECIMAL(10,2))avg_range
FROM EV
	WHERE electric_range > 0
GROUP BY city
HAVING COUNT(*) > 100
ORDER BY avg_range DESC;

-- 3. MANUFACTURER PERFORMANCE: Identifying brands with the best battery technology
SELECT
	TOP 3
	make,
	CAST(AVG(electric_range) AS DECIMAL(10,2))avg_range
FROM EV
	WHERE electric_range > 0
GROUP BY make
ORDER BY avg_range DESC;

-- 4. SALES VOLUME: Most popular manufacturer and model
-- Query for top manufacturer 
SELECT
	TOP 1
	make,
	COUNT(*) AS no_of_vehicle
FROM EV
GROUP BY make
ORDER BY no_of_vehicle DESC;

-- Query for worst manufacturer
SELECT
	TOP 1
	make,
	COUNT(*) AS no_of_vehicle
FROM EV
GROUP BY make
ORDER BY no_of_vehicle ASC;

-- Query for top specific model
SELECT
	TOP 1
	make,
	model,
	COUNT(*) AS no_of_vehicle
FROM EV
GROUP BY make, model
ORDER BY no_of_vehicle DESC;

-- Query for Worst specific model
SELECT
	TOP 1
	make,
	model,
	COUNT(*) AS no_of_vehicle
FROM EV
GROUP BY make, model
ORDER BY no_of_vehicle ASC;

-- Query for most sold car in a specific year
SELECT
	TOP 1
	make,
	model_year,
	COUNT(*) AS model_sold
FROM EV
GROUP BY make, model_year
ORDER BY model_sold DESC;

-- Query for most sold car in a specific year
SELECT
	TOP 1
	make,
	model_year,
	COUNT(*) AS model_sold
FROM EV
GROUP BY make, model_year
ORDER BY model_sold ASC;

-- 5. RANGE EXTREMES: Best and worst performing vehicles by electric range
-- Best Range
SELECT
	TOP 1
	make,
	model,
	model_year,
	electric_range
FROM EV
ORDER BY electric_range DESC;

-- Worst Range (Excluding 0 values which represent missing data)
SELECT
	TOP 1
	make,
	model,
	model_year,
	electric_range
FROM EV
	WHERE electric_range > 0
ORDER BY electric_range ASC;

-- 6. POLICY & ELIGIBILITY: Clean Alternative Fuel Vehicle (CAFV) status distribution
SELECT
	cafv_eligibility,
	COUNT(*) AS no_of_vehicles,
	CAST(COUNT(*) * 100.0/ (SELECT COUNT(*) FROM EV) AS DECIMAL(10,2))vehicle_percent
FROM EV
GROUP BY cafv_eligibility
ORDER BY vehicle_percent DESC

-- 7. DATA INTEGRITY CHECK: Monitoring future-dated model year entries
SELECT
	TOP 10
	make,
	model,
	COUNT(*) AS vehicle_counts,
	model_year
FROM EV 
WHERE model_year >= 2025
GROUP BY make,model,model_year
ORDER BY vehicle_counts DESC;

-- 8. Identifying cities with the highest adoption of pure Battery Electric Vehicles (BEV)
SELECT 
	TOP 5
    city, 
    COUNT(*) AS bev_count
FROM EV
WHERE electric_vehicle_type = 'Battery Electric Vehicle (BEV)'
GROUP BY city
ORDER BY bev_count DESC;

-- 9. Comparing top-selling models against their average electric range
SELECT 
	TOP 10
    make, 
    model, 
    COUNT(*) AS units_sold,
    CAST(AVG(electric_range) AS DECIMAL(10,2)) AS avg_range
FROM EV
WHERE electric_range > 0
GROUP BY make, model
ORDER BY units_sold DESC;

-- 10. MARKET SEGMENTATION (Case Logic)
SELECT 
    CASE 
        WHEN electric_range < 100 THEN 'Short Range (<100 mi)'
        WHEN electric_range BETWEEN 100 AND 250 THEN 'Mid Range (100-250 mi)'
        ELSE 'Long Range (>250 mi)'
    END AS Range_Category,
    COUNT(*) AS Total_Vehicles
FROM EV
WHERE electric_range > 0
GROUP BY 
    CASE 
        WHEN electric_range < 100 THEN 'Short Range (<100 mi)'
        WHEN electric_range BETWEEN 100 AND 250 THEN 'Mid Range (100-250 mi)'
        ELSE 'Long Range (>250 mi)'
    END
ORDER BY Total_Vehicles DESC;

-- 11. TOP MODELS PER BRAND
WITH BrandRanking AS (
    SELECT 
        make, 
        model, 
        COUNT(*) AS units_sold,
        RANK() OVER (PARTITION BY make ORDER BY COUNT(*) DESC) as rnk
    FROM EV
    GROUP BY make, model
)
SELECT make, model, units_sold
FROM BrandRanking
WHERE rnk = 1 AND units_sold > 50
ORDER BY units_sold DESC;