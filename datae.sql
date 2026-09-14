CREATE DATABASE realtime_analyzer;

USE realtime_analyzer;
CREATE TABLE sensor_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sensor_name VARCHAR(50) NOT NULL,
    sensor_value DECIMAL(10,2) NOT NULL,
    unit VARCHAR(20),
    status VARCHAR(20),
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO sensor_data
(sensor_name, sensor_value, unit, status)
VALUES
('Temperature', 32.5, '°C', 'Normal'),
('Humidity', 65.2, '%', 'Normal'),
('Pressure', 1012.4, 'hPa', 'Normal');
SELECT *
FROM sensor_data
ORDER BY recorded_at DESC
LIMIT 10;
SELECT 
    sensor_name,
    AVG(sensor_value) AS average_value
FROM sensor_data
GROUP BY sensor_name;
SELECT *
FROM sensor_data
WHERE sensor_name = 'Temperature'
AND sensor_value > 40
ORDER BY recorded_at DESC;
SELECT 
    sensor_name,
    sensor_value,
    unit,
    CASE
        WHEN sensor_name = 'Temperature' AND sensor_value > 40
            THEN 'Critical'
        WHEN sensor_name = 'Temperature' AND sensor_value > 35
            THEN 'Warning'
        ELSE 'Normal'
    END AS current_status,
    recorded_at
FROM sensor_data
ORDER BY recorded_at DESC;
SELECT s.*
FROM sensor_data s
INNER JOIN (
    SELECT sensor_name, MAX(recorded_at) AS latest_time
    FROM sensor_data
    GROUP BY sensor_name
) latest
ON s.sensor_name = latest.sensor_name
AND s.recorded_at = latest.latest_time;
