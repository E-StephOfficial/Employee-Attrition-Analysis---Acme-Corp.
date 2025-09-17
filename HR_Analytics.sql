CREATE DATABASE HR_Analytics;
GO

-- Overall Attrition Rate (BIT version)
SELECT 
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS AttritionRatePercent
FROM EmployeeAttrition;

-- Attrition by Department
SELECT 
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS AttritionRatePercent
FROM EmployeeAttrition
GROUP BY Department
ORDER BY AttritionRatePercent DESC;

-- Attrition by Salary Band
SELECT 
    CASE 
        WHEN MonthlyIncome < 3000 THEN 'Low'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium'
        ELSE 'High'
    END AS SalaryBand,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS AttritionRatePercent
FROM EmployeeAttrition
GROUP BY 
    CASE 
        WHEN MonthlyIncome < 3000 THEN 'Low'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium'
        ELSE 'High'
    END
ORDER BY AttritionRatePercent DESC;

-- Attrition by Overtime
SELECT 
    OverTime,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS AttritionRatePercent
FROM EmployeeAttrition
GROUP BY OverTime
ORDER BY AttritionRatePercent DESC;

-- Attrition by Job Role
SELECT 
    JobRole,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS AttritionRatePercent
FROM EmployeeAttrition
GROUP BY JobRole
ORDER BY AttritionRatePercent DESC;

-- Attrition by Age Group
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and above'
    END AS AgeGroup,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS AttritionRatePercent
FROM EmployeeAttrition
GROUP BY 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and above'
    END
ORDER BY AttritionRatePercent DESC;

-- Attrition by Job Satisfaction
SELECT 
    JobSatisfaction,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS AttritionRatePercent
FROM EmployeeAttrition
GROUP BY JobSatisfaction
ORDER BY AttritionRatePercent DESC;

-- Attrition by Distance From Home
SELECT 
    CASE 
        WHEN DistanceFromHome BETWEEN 0 AND 5 THEN '0-5 km'
        WHEN DistanceFromHome BETWEEN 6 AND 10 THEN '6-10 km'
        WHEN DistanceFromHome BETWEEN 11 AND 20 THEN '11-20 km'
        ELSE '21+ km'
    END AS DistanceGroup,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS AttritionRatePercent
FROM EmployeeAttrition
GROUP BY 
    CASE 
        WHEN DistanceFromHome BETWEEN 0 AND 5 THEN '0-5 km'
        WHEN DistanceFromHome BETWEEN 6 AND 10 THEN '6-10 km'
        WHEN DistanceFromHome BETWEEN 11 AND 20 THEN '11-20 km'
        ELSE '21+ km'
    END
ORDER BY AttritionRatePercent DESC;
   