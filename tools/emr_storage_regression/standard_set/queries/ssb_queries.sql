SELECT SUM(lo_extendedprice * lo_discount) AS REVENUE FROM lineorder, dates WHERE lo_orderdate = d_datekey AND d_year = 1993 AND lo_discount BETWEEN 1 AND 3 AND lo_quantity < 25;
SELECT SUM(lo_extendedprice * lo_discount) AS REVENUE FROM lineorder, dates WHERE lo_orderdate = d_datekey AND d_yearmonth = 'Jan1994' AND lo_discount BETWEEN 4 AND 6 AND lo_quantity BETWEEN 26 AND 35;
SELECT SUM(lo_extendedprice * lo_discount) AS REVENUE FROM lineorder, dates WHERE lo_orderdate = d_datekey AND d_weeknuminyear = 6 AND d_year = 1994 AND lo_discount BETWEEN 5 AND 7 AND lo_quantity BETWEEN 26 AND 35;
SELECT SUM(lo_revenue), d_year, p_brand FROM lineorder, dates, part, supplier WHERE lo_orderdate = d_datekey AND lo_partkey = p_partkey AND lo_suppkey = s_suppkey AND p_category = 'MFGR#12' AND s_region = 'AMERICA' GROUP BY d_year, p_brand ORDER BY p_brand;
SELECT SUM(lo_revenue), d_year, p_brand FROM lineorder, dates, part, supplier WHERE lo_orderdate = d_datekey AND lo_partkey = p_partkey AND lo_suppkey = s_suppkey AND p_brand BETWEEN 'MFGR#2221' AND 'MFGR#2228' AND s_region = 'ASIA' GROUP BY d_year, p_brand ORDER BY d_year, p_brand;
SELECT SUM(lo_revenue), d_year, p_brand FROM lineorder, dates, part, supplier WHERE lo_orderdate = d_datekey AND lo_partkey = p_partkey AND lo_suppkey = s_suppkey AND p_brand = 'MFGR#2239' AND s_region = 'EUROPE' GROUP BY d_year, p_brand ORDER BY d_year, p_brand;
SELECT c_nation, s_nation, d_year, SUM(lo_revenue) AS REVENUE FROM customer, lineorder, supplier, dates WHERE lo_custkey = c_custkey AND lo_suppkey = s_suppkey AND lo_orderdate = d_datekey AND c_region = 'ASIA' AND s_region = 'ASIA' AND d_year >= 1992 AND d_year <= 1997 GROUP BY c_nation, s_nation, d_year ORDER BY d_year ASC, REVENUE DESC;
SELECT c_city, s_city, d_year, SUM(lo_revenue) AS REVENUE FROM customer, lineorder, supplier, dates WHERE lo_custkey = c_custkey AND lo_suppkey = s_suppkey AND lo_orderdate = d_datekey AND c_nation = 'UNITED STATES' AND s_nation = 'UNITED STATES' AND d_year >= 1992 AND d_year <= 1997 GROUP BY c_city, s_city, d_year ORDER BY d_year ASC, REVENUE DESC;
SELECT c_city, s_city, d_year, SUM(lo_revenue) AS REVENUE FROM customer, lineorder, supplier, dates WHERE lo_custkey = c_custkey AND lo_suppkey = s_suppkey AND lo_orderdate = d_datekey AND ( c_city = 'UNITED KI1' OR c_city = 'UNITED KI5' ) AND ( s_city = 'UNITED KI1' OR s_city = 'UNITED KI5' ) AND d_year >= 1992 AND d_year <= 1997 GROUP BY c_city, s_city, d_year ORDER BY d_year ASC, REVENUE DESC;
SELECT c_city, s_city, d_year, SUM(lo_revenue) AS REVENUE FROM customer, lineorder, supplier, dates WHERE lo_custkey = c_custkey AND lo_suppkey = s_suppkey AND lo_orderdate = d_datekey AND ( c_city = 'UNITED KI1' OR c_city = 'UNITED KI5' ) AND ( s_city = 'UNITED KI1' OR s_city = 'UNITED KI5' ) AND d_yearmonth = 'Dec1997' GROUP BY c_city, s_city, d_year ORDER BY d_year ASC, REVENUE DESC;
SELECT d_year, c_nation, SUM(lo_revenue - lo_supplycost) AS PROFIT FROM dates, customer, supplier, part, lineorder WHERE lo_custkey = c_custkey AND lo_suppkey = s_suppkey AND lo_partkey = p_partkey AND lo_orderdate = d_datekey AND c_region = 'AMERICA' AND s_region = 'AMERICA' AND ( p_mfgr = 'MFGR#1' OR p_mfgr = 'MFGR#2' ) GROUP BY d_year, c_nation ORDER BY d_year, c_nation;
SELECT d_year, s_nation, p_category, SUM(lo_revenue - lo_supplycost) AS PROFIT FROM dates, customer, supplier, part, lineorder WHERE lo_custkey = c_custkey AND lo_suppkey = s_suppkey AND lo_partkey = p_partkey AND lo_orderdate = d_datekey AND c_region = 'AMERICA' AND s_region = 'AMERICA' AND ( d_year = 1997 OR d_year = 1998 ) AND ( p_mfgr = 'MFGR#1' OR p_mfgr = 'MFGR#2' ) GROUP BY d_year, s_nation, p_category ORDER BY d_year, s_nation, p_category;
SELECT d_year, s_city, p_brand, SUM(lo_revenue - lo_supplycost) AS PROFIT FROM dates, customer, supplier, part, lineorder WHERE lo_custkey = c_custkey AND lo_suppkey = s_suppkey AND lo_partkey = p_partkey AND lo_orderdate = d_datekey AND s_nation = 'UNITED STATES' AND ( d_year = 1997 OR d_year = 1998 ) AND p_category = 'MFGR#14' GROUP BY d_year, s_city, p_brand ORDER BY d_year, s_city, p_brand;
