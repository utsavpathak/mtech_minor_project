SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1999-01-01' - INTERVAL '3 days'
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;
SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '7 days'
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;
SELECT
    l_returnflag,
    l_linestatus,
    l_shipmode,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '3 days'
GROUP BY
    l_returnflag,
    l_linestatus,
    l_shipmode
ORDER BY
    l_returnflag,
    l_linestatus,
    l_shipmode;
SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '3 days'
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_linestatus, 
    l_returnflag;
SELECT
    l_returnflag,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '3 days'
GROUP BY
    l_returnflag
ORDER BY
    l_returnflag;
SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    MIN(l_extendedprice) AS min_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '3 days'
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;
SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    MAX(l_extendedprice) AS max_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '3 days'
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;
SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_commitdate <= DATE '1998-12-01' - INTERVAL '3 days'
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;
SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '3 days'
    AND l_quantity > 50
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;
SELECT
    l_shipmode,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '3 days'
GROUP BY
    l_shipmode,
    l_linestatus
ORDER BY
    l_shipmode,
    l_linestatus;







-- Q2




SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-10-02' - INTERVAL '90' DAY
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;


SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-09-02' - INTERVAL '60' DAY
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;


SELECT
    l_returnflag,
    l_linestatus,
    l_shipmode,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-09-02' - INTERVAL '90' DAY
GROUP BY
    l_returnflag,
    l_linestatus,
    l_shipmode
ORDER BY
    l_returnflag,
    l_linestatus,
    l_shipmode;



SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-09-02' - INTERVAL '90' DAY
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_linestatus, 
    l_returnflag;


SELECT
    l_returnflag,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-09-02' - INTERVAL '90' DAY
GROUP BY
    l_returnflag
ORDER BY
    l_returnflag;



SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    MIN(l_extendedprice) AS min_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-09-02' - INTERVAL '90' DAY
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;




SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    MAX(l_extendedprice) AS max_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-09-02' - INTERVAL '90' DAY
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;




SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_commitdate <= DATE '1998-09-02' - INTERVAL '90' DAY
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;





SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-09-02' - INTERVAL '90' DAY
    AND l_quantity > 50
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;




SELECT
    l_shipmode,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-09-02' - INTERVAL '90' DAY
GROUP BY
    l_shipmode,
    l_linestatus
ORDER BY
    l_shipmode,
    l_linestatus;


--Q3




SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 30
    AND p_type LIKE '%STEEL'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND ps_supplycost = (
        SELECT
            MIN(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    s_acctbal DESC,
    n_name,
    s_name,
    p_partkey
LIMIT 100;



SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 25
    AND p_type LIKE '%ALUMINUM'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND ps_supplycost = (
        SELECT
            MIN(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    s_acctbal DESC,
    n_name,
    s_name,
    p_partkey
LIMIT 100;



SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 25
    AND p_type LIKE '%STEEL'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND ps_supplycost = (
        SELECT
            MIN(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    n_name,
    s_name,
    s_acctbal DESC,
    p_partkey
LIMIT 100;




SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_brand,
    s_address,
    s_phone,
    s_comment
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 25
    AND p_type LIKE '%STEEL'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND ps_supplycost = (
        SELECT
            MIN(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    s_acctbal DESC,
    n_name,
    s_name,
    p_partkey
LIMIT 100;




SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 25
    AND p_type LIKE '%STEEL'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND s_acctbal > 1000
    AND ps_supplycost = (
        SELECT
            MIN(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    s_acctbal DESC,
    n_name,
    s_name,
    p_partkey
LIMIT 100;

-- Q4

SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-11-01' - INTERVAL '90 days'
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;



SELECT
    l_shipmode,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '90 days'
GROUP BY
    l_shipmode,
    l_linestatus
ORDER BY
    l_shipmode,
    l_linestatus;





SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '90 days'
    AND l_discount < 0.05
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;





SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '90 days'
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_linestatus,
    l_returnflag;




SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '90 days'
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;





SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    MIN(l_quantity) AS min_qty,
    MIN(l_extendedprice) AS min_price,
    MIN(l_discount) AS min_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '90 days'
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;





SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '60 days'
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;






SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    COUNT(*) AS count_order
FROM
    lineitem
WHERE
    l_shipdate <= DATE '1998-12-01' - INTERVAL '90 days'
GROUP BY
    l_returnflag,
    l_linestatus
ORDER BY
    l_returnflag,
    l_linestatus;





-- Q5


SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 20
    AND p_type LIKE '%BRASS%'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND ps_supplycost = (
        SELECT
            MIN(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    s_acctbal DESC,
    n_name,
    s_name,
    p_partkey;







SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 15
    AND p_type LIKE '%STEEL%'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND ps_supplycost = (
        SELECT
            MIN(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    s_acctbal DESC,
    n_name,
    s_name,
    p_partkey;







SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 15
    AND p_type LIKE '%BRASS%'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND s_acctbal > 1000
    AND ps_supplycost = (
        SELECT
            MIN(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    s_acctbal DESC,
    n_name,
    s_name,
    p_partkey;





SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 15
    AND p_type LIKE '%BRASS%'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND ps_supplycost = (
        SELECT
            MIN(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    n_name,
    s_acctbal DESC,
    s_name,
    p_partkey;







SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 15
    AND p_type LIKE '%BRASS%'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND ps_supplycost = (
        SELECT
            MIN(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    s_acctbal DESC,
    n_name,
    s_name,
    p_partkey;













SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 15
    AND p_type LIKE '%BRASS%'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND ps_supplycost = (
        SELECT
            MAX(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    s_acctbal DESC,
    n_name,
    s_name,
    p_partkey;







SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 15
    AND p_type LIKE '%BRASS%'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'ASIA'
    AND ps_supplycost = (
        SELECT
            MIN(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'ASIA'
    )
ORDER BY
    s_acctbal DESC,
    n_name,
    s_name,
    p_partkey;

















SELECT
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 15
    AND p_type LIKE '%BRASS%'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND ps_supplycost = (
        SELECT
            AVG(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    s_acctbal DESC,
    n_name,
    s_name,
    p_partkey;



SELECT
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_phone
FROM
    part,
    supplier,
    partsupp,
    nation,
    region
WHERE
    p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_size = 15
    AND p_type LIKE '%BRASS%'
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND ps_supplycost = (
        SELECT
            MIN(ps_supplycost)
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            p_partkey = ps_partkey
            AND s_suppkey = ps_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'EUROPE'
    )
ORDER BY
    s_acctbal DESC,
    n_name,
    s_name,
    p_partkey;




   





-- Original query 6




-- Query 1: Change the date range in the WHERE clause
SELECT
    o_orderpriority,
    COUNT(*) AS order_count
FROM
    orders
WHERE
    o_orderdate >= DATE '1993-07-01' - INTERVAL '1 month'
    AND o_orderdate < DATE '1993-07-01' + INTERVAL '3 month'
    AND EXISTS (
        SELECT
            *
        FROM
            lineitem
        WHERE
            l_orderkey = o_orderkey
            AND l_commitdate < l_receiptdate
    )
GROUP BY
    o_orderpriority
ORDER BY
    o_orderpriority;

-- Query 2: Change the condition in the EXISTS subquery
SELECT
    o_orderpriority,
    COUNT(*) AS order_count
FROM
    orders
WHERE
    o_orderdate >= DATE '1993-07-01'
    AND o_orderdate < DATE '1993-07-01' + INTERVAL '3 month'
    AND EXISTS (
        SELECT
            *
        FROM
            lineitem
        WHERE
            l_orderkey = o_orderkey
            AND l_commitdate > l_receiptdate -- Changed condition
    )
GROUP BY
    o_orderpriority
ORDER BY
    o_orderpriority;

-- Query 3: Remove the EXISTS condition
SELECT
    o_orderpriority,
    COUNT(*) AS order_count
FROM
    orders
WHERE
    o_orderdate >= DATE '1993-07-01'
    AND o_orderdate < DATE '1993-07-01' + INTERVAL '3 month'
GROUP BY
    o_orderpriority
ORDER BY
    o_orderpriority;

-- Query 4: Change the date interval in the WHERE clause
SELECT
    o_orderpriority,
    COUNT(*) AS order_count
FROM
    orders
WHERE
    o_orderdate >= DATE '1993-07-01'
    AND o_orderdate < DATE '1993-07-01' + INTERVAL '6 month' -- Changed interval
    AND EXISTS (
        SELECT
            *
        FROM
            lineitem
        WHERE
            l_orderkey = o_orderkey
            AND l_commitdate < l_receiptdate
    )
GROUP BY
    o_orderpriority
ORDER BY
    o_orderpriority;

-- Query 5: Change the grouping columns
SELECT
    o_clerk,
    COUNT(*) AS order_count
FROM
    orders
WHERE
    o_orderdate >= DATE '1993-07-01'
    AND o_orderdate < DATE '1993-07-01' + INTERVAL '3 month'
    AND EXISTS (
        SELECT
            *
        FROM
            lineitem
        WHERE
            l_orderkey = o_orderkey
            AND l_commitdate < l_receiptdate
    )
GROUP BY
    o_clerk
ORDER BY
    o_clerk;

-- Query 6: Add a new filter in the WHERE clause
SELECT
    o_orderpriority,
    COUNT(*) AS order_count
FROM
    orders
WHERE
    o_orderdate >= DATE '1993-07-01'
    AND o_orderdate < DATE '1993-07-01' + INTERVAL '3 month'
    AND o_totalprice > 10000 -- New filter condition
    AND EXISTS (
        SELECT
            *
        FROM
            lineitem
        WHERE
            l_orderkey = o_orderkey
            AND l_commitdate < l_receiptdate
    )
GROUP BY
    o_orderpriority
ORDER BY
    o_orderpriority;

-- Query 7: Change the ORDER BY clause
SELECT
    o_orderpriority,
    COUNT(*) AS order_count
FROM
    orders
WHERE
    o_orderdate >= DATE '1993-07-01'
    AND o_orderdate < DATE '1993-07-01' + INTERVAL '3 month'
    AND EXISTS (
        SELECT
            *
        FROM
            lineitem
        WHERE
            l_orderkey = o_orderkey
            AND l_commitdate < l_receiptdate
    )
GROUP BY
    o_orderpriority
ORDER BY
    order_count DESC;

-- Query 8: Remove the ORDER BY clause
SELECT
    o_orderpriority,
    COUNT(*) AS order_count
FROM
    orders
WHERE
    o_orderdate >= DATE '1993-07-01'
    AND o_orderdate < DATE '1993-07-01' + INTERVAL '3 month'
    AND EXISTS (
        SELECT
            *
        FROM
            lineitem
        WHERE
            l_orderkey = o_orderkey
            AND l_commitdate < l_receiptdate
    )
GROUP BY
    o_orderpriority;

-- Query 9: Change the COUNT(*) to SUM(o_totalprice)
SELECT
    o_orderpriority,
    SUM(o_totalprice) AS total_price
FROM
    orders
WHERE
    o_orderdate >= DATE '1993-07-01'
    AND o_orderdate < DATE '1993-07-01' + INTERVAL '3 month'
    AND EXISTS (
        SELECT
            *
        FROM
            lineitem
        WHERE
            l_orderkey = o_orderkey
            AND l_commitdate < l_receiptdate
    )
GROUP BY
    o_orderpriority
ORDER BY
    o_orderpriority;

-- Query 10: Change the EXISTS subquery to a JOIN
SELECT
    o_orderpriority,
    COUNT(*) AS order_count
FROM
    orders o
JOIN
    lineitem l ON o.o_orderkey = l.l_orderkey AND l.l_commitdate < l.l_receiptdate
WHERE
    o.o_orderdate >= DATE '1993-07-01'
    AND o.o_orderdate < DATE '1993-07-01' + INTERVAL '3 month'
GROUP BY
    o_orderpriority
ORDER BY
    o_orderpriority;





-- Q7



-- Query 1: Change the region name in the WHERE clause
SELECT
    n_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    customer,
    orders,
    lineitem,
    supplier,
    nation,
    region
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND l_suppkey = s_suppkey
    AND c_nationkey = s_nationkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE' -- Changed region name
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1995-01-01'
GROUP BY
    n_name
ORDER BY
    revenue DESC;

-- Query 2: Change the date range in the WHERE clause
SELECT
    n_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    customer,
    orders,
    lineitem,
    supplier,
    nation,
    region
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND l_suppkey = s_suppkey
    AND c_nationkey = s_nationkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'ASIA'
    AND o_orderdate >= DATE '1995-01-01' -- Changed start date
    AND o_orderdate < DATE '1996-01-01' -- Changed end date
GROUP BY
    n_name
ORDER BY
    revenue DESC;

-- Query 3: Remove the ORDER BY clause
SELECT
    n_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    customer,
    orders,
    lineitem,
    supplier,
    nation,
    region
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND l_suppkey = s_suppkey
    AND c_nationkey = s_nationkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'ASIA'
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1995-01-01'
GROUP BY
    n_name;

-- Query 4: Change the aggregation function to AVG
SELECT
    n_name,
    AVG(l_extendedprice * (1 - l_discount)) AS avg_revenue
FROM
    customer,
    orders,
    lineitem,
    supplier,
    nation,
    region
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND l_suppkey = s_suppkey
    AND c_nationkey = s_nationkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'ASIA'
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1995-01-01'
GROUP BY
    n_name
ORDER BY
    avg_revenue DESC;

-- Query 5: Change the GROUP BY column
SELECT
    r_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    customer,
    orders,
    lineitem,
    supplier,
    nation,
    region
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND l_suppkey = s_suppkey
    AND c_nationkey = s_nationkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name IN ('ASIA', 'EUROPE') -- Changed GROUP BY column
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1995-01-01'
GROUP BY
    r_name
ORDER BY
    revenue DESC;

-- Query 6: Add a new filter in the WHERE clause
SELECT
    n_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    customer,
    orders,
    lineitem,
    supplier,
    nation,
    region
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND l_suppkey = s_suppkey
    AND c_nationkey = s_nationkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'ASIA'
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1995-01-01'
    AND l_discount < 0.05 -- New filter condition
GROUP BY
    n_name
ORDER BY
    revenue DESC;

-- Query 7: Change the JOIN condition to use explicit JOIN syntax
SELECT
    n_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    customer
JOIN
    orders ON c_custkey = o_custkey
JOIN
    lineitem ON l_orderkey = o_orderkey
JOIN
    supplier ON l_suppkey = s_suppkey
JOIN
    nation ON c_nationkey = s_nationkey
JOIN
    region ON s_nationkey = n_nationkey AND n_regionkey = r_regionkey
WHERE
    r_name = 'ASIA'
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1995-01-01'
GROUP BY
    n_name
ORDER BY
    revenue DESC;

-- Query 8: Change the SELECT columns
SELECT
    n_name,
    SUM(l_extendedprice * (1 - l_discount)) AS total_revenue
FROM
    customer,
    orders,
    lineitem,
    supplier,
    nation,
    region
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND l_suppkey = s_suppkey
    AND c_nationkey = s_nationkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'ASIA'
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1995-01-01'
GROUP BY
    n_name
ORDER BY
    total_revenue DESC;

-- Query 10: Add an additional JOIN with another table
SELECT
    n_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    c_mktsegment
FROM
    customer
JOIN
    orders ON c_custkey = o_custkey
JOIN
    lineitem ON l_orderkey = o_orderkey
JOIN
    supplier ON l_suppkey = s_suppkey
JOIN
    nation ON c_nationkey = s_nationkey
JOIN
    region ON s_nationkey = n_nationkey AND n_regionkey = r_regionkey
WHERE
    r_name = 'ASIA'
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1995-01-01'
GROUP BY
    n_name, c_mktsegment
ORDER BY
    revenue DESC;

-- Query 1: Change the market segment in the WHERE clause
SELECT
    l_orderkey,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    o_orderdate,
    o_shippriority
FROM
    customer,
    orders,
    lineitem
WHERE
    c_mktsegment = 'HOUSEHOLD' -- Changed market segment
    AND c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate < DATE '1995-03-01'
    AND l_shipdate > DATE '1995-03-01'
GROUP BY
    l_orderkey,
    o_orderdate,
    o_shippriority
ORDER BY
    revenue DESC,
    o_orderdate;

-- Query 2: Change the date range in the WHERE clause
SELECT
    l_orderkey,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    o_orderdate,
    o_shippriority
FROM
    customer,
    orders,
    lineitem
WHERE
    c_mktsegment = 'AUTOMOBILE'
    AND c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate >= DATE '1995-01-01' -- Changed start date
    AND o_orderdate < DATE '1996-01-01' -- Changed end date
    AND l_shipdate > DATE '1995-03-01'
GROUP BY
    l_orderkey,
    o_orderdate,
    o_shippriority
ORDER BY
    revenue DESC,
    o_orderdate;

-- Query 3: Remove the ORDER BY clause
SELECT
    l_orderkey,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    o_orderdate,
    o_shippriority
FROM
    customer,
    orders,
    lineitem
WHERE
    c_mktsegment = 'AUTOMOBILE'
    AND c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate < DATE '1995-03-01'
    AND l_shipdate > DATE '1995-03-01'
GROUP BY
    l_orderkey,
    o_orderdate,
    o_shippriority;

-- Query 4: Change the aggregation function to AVG
SELECT
    l_orderkey,
    AVG(l_extendedprice * (1 - l_discount)) AS avg_revenue,
    o_orderdate,
    o_shippriority
FROM
    customer,
    orders,
    lineitem
WHERE
    c_mktsegment = 'AUTOMOBILE'
    AND c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate < DATE '1995-03-01'
    AND l_shipdate > DATE '1995-03-01'
GROUP BY
    l_orderkey,
    o_orderdate,
    o_shippriority
ORDER BY
    avg_revenue DESC,
    o_orderdate;

-- Query 5: Change the GROUP BY columns
SELECT
    l_orderkey,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    o_orderdate,
    o_shippriority,
    c_mktsegment
FROM
    customer,
    orders,
    lineitem
WHERE
    c_mktsegment = 'AUTOMOBILE'
    AND c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate < DATE '1995-03-01'
    AND l_shipdate > DATE '1995-03-01'
GROUP BY
    l_orderkey,
    o_orderdate,
    o_shippriority,
    c_mktsegment
ORDER BY
    revenue DESC,
    o_orderdate;

-- Query 6: Add a new filter in the WHERE clause
SELECT
    l_orderkey,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    o_orderdate,
    o_shippriority
FROM
    customer,
    orders,
    lineitem
WHERE
    c_mktsegment = 'AUTOMOBILE'
    AND c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate < DATE '1995-03-01'
    AND l_shipdate > DATE '1995-03-01'
    AND l_discount < 0.05 -- New filter condition
GROUP BY
    l_orderkey,
    o_orderdate,
    o_shippriority
ORDER BY
    revenue DESC,
    o_orderdate;

-- Query 7: Change the JOIN condition to use explicit JOIN syntax
SELECT
    l_orderkey,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    o_orderdate,
    o_shippriority
FROM
    customer
JOIN
    orders ON c_custkey = o_custkey
JOIN
    lineitem ON l_orderkey = o_orderkey
WHERE
    c_mktsegment = 'AUTOMOBILE'
    AND o_orderdate < DATE '1995-03-01'
    AND l_shipdate > DATE '1995-03-01'
GROUP BY
    l_orderkey,
    o_orderdate,
    o_shippriority
ORDER BY
    revenue DESC,
    o_orderdate;

-- Query 8: Change the SELECT columns
SELECT
    l_orderkey,
    SUM(l_extendedprice * (1 - l_discount)) AS total_revenue,
    o_orderdate,
    o_shippriority
FROM
    customer,
    orders,
    lineitem
WHERE
    c_mktsegment = 'AUTOMOBILE'
    AND c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate < DATE '1995-03-01'
    AND l_shipdate > DATE '1995-03-01'
GROUP BY
    l_orderkey,
    o_orderdate,
    o_shippriority
ORDER BY
    total_revenue DESC,
    o_orderdate;

-- Query 10: Add an additional JOIN with another table
SELECT
    l_orderkey,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    o_orderdate,
    o_shippriority,
    c_mktsegment
FROM
    customer
JOIN
    orders ON c_custkey = o_custkey
JOIN
    lineitem ON l_orderkey = o_orderkey
JOIN
    nation ON c_nationkey = n_nationkey
WHERE
    c_mktsegment = 'AUTOMOBILE'
    AND o_orderdate < DATE '1995-03-01'
    AND l_shipdate > DATE '1995-03-01'
GROUP BY
    l_orderkey,
    o_orderdate,
    o_shippriority,
    c_mktsegment
ORDER BY
    revenue DESC,
    o_orderdate;

-- Query 1: Change the date range in the WHERE clause
SELECT
    SUM(l_extendedprice * l_discount) AS revenue
FROM
    lineitem
WHERE
    l_shipdate >= DATE '1994-07-01' -- Changed start date
    AND l_shipdate < DATE '1994-07-01' + INTERVAL '1 year'
    AND l_discount BETWEEN 0.06 - 0.01 AND 0.06 + 0.01
    AND l_quantity < 24;

-- Query 2: Change the discount range in the WHERE clause
SELECT
    SUM(l_extendedprice * l_discount) AS revenue
FROM
    lineitem
WHERE
    l_shipdate >= DATE '1993-07-01'
    AND l_shipdate < DATE '1993-07-01' + INTERVAL '1 year'
    AND l_discount BETWEEN 0.07 - 0.01 AND 0.07 + 0.01 -- Changed discount range
    AND l_quantity < 24;

-- Query 3: Remove the BETWEEN clause for discount
SELECT
    SUM(l_extendedprice * l_discount) AS revenue
FROM
    lineitem
WHERE
    l_shipdate >= DATE '1993-07-01'
    AND l_shipdate < DATE '1993-07-01' + INTERVAL '1 year'
    AND l_discount = 0.06 -- Removed BETWEEN clause
    AND l_quantity < 24;

-- Query 4: Change the aggregation function to AVG
SELECT
    AVG(l_extendedprice * l_discount) AS avg_revenue
FROM
    lineitem
WHERE
    l_shipdate >= DATE '1993-07-01'
    AND l_shipdate < DATE '1993-07-01' + INTERVAL '1 year'
    AND l_discount BETWEEN 0.06 - 0.01 AND 0.06 + 0.01
    AND l_quantity < 24;

-- Query 5: Change the GROUP BY clause
SELECT
    COUNT(*) AS count_items,
    SUM(l_extendedprice * l_discount) AS revenue
FROM
    lineitem
WHERE
    l_shipdate >= DATE '1993-07-01'
    AND l_shipdate < DATE '1993-07-01' + INTERVAL '1 year'
    AND l_discount BETWEEN 0.06 - 0.01 AND 0.06 + 0.01
    AND l_quantity < 24
GROUP BY
    l_discount; -- Changed GROUP BY clause

-- Query 6: Add a new filter in the WHERE clause
SELECT
    SUM(l_extendedprice * l_discount) AS revenue
FROM
    lineitem
WHERE
    l_shipdate >= DATE '1993-07-01'
    AND l_shipdate < DATE '1993-07-01' + INTERVAL '1 year'
    AND l_discount BETWEEN 0.06 - 0.01 AND 0.06 + 0.01
    AND l_quantity < 24
    AND l_extendedprice > 1000; -- New filter condition

-- Query 7: Change the JOIN condition to use explicit JOIN syntax
SELECT
    SUM(l_extendedprice * l_discount) AS revenue
FROM
    lineitem
JOIN
    orders ON lineitem.l_orderkey = orders.o_orderkey
WHERE
    l_shipdate >= DATE '1993-07-01'
    AND l_shipdate < DATE '1993-07-01' + INTERVAL '1 year'
    AND l_discount BETWEEN 0.06 - 0.01 AND 0.06 + 0.01
    AND l_quantity < 24;

-- Query 8: Change the SELECT columns
SELECT
    l_orderkey,
    SUM(l_extendedprice * l_discount) AS revenue
FROM
    lineitem
WHERE
    l_shipdate >= DATE '1993-07-01'
    AND l_shipdate < DATE '1993-07-01' + INTERVAL '1 year'
    AND l_discount BETWEEN 0.06 - 0.01 AND 0.06 + 0.01
    AND l_quantity < 24
GROUP BY
    l_orderkey
ORDER BY
    revenue DESC;

-- Query 1: Change the date range in the WHERE clause
SELECT
    c_custkey,
    c_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    c_acctbal,
    n_name,
    c_address,
    c_phone,
    c_comment
FROM
    customer,
    orders,
    lineitem,
    nation
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate >= DATE '1995-01-01' -- Changed start date
    AND o_orderdate < DATE '1995-01-01' + INTERVAL '3 month'
    AND l_returnflag = 'R'
    AND c_nationkey = n_nationkey
GROUP BY
    c_custkey,
    c_name,
    c_acctbal,
    c_phone,
    n_name,
    c_address,
    c_comment
ORDER BY
    revenue DESC
LIMIT 20;

-- Query 2: Remove the ORDER BY clause
SELECT
    c_custkey,
    c_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    c_acctbal,
    n_name,
    c_address,
    c_phone,
    c_comment
FROM
    customer,
    orders,
    lineitem,
    nation
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1994-01-01' + INTERVAL '3 month'
    AND l_returnflag = 'R'
    AND c_nationkey = n_nationkey
GROUP BY
    c_custkey,
    c_name,
    c_acctbal,
    c_phone,
    n_name,
    c_address,
    c_comment;

-- Query 3: Change the aggregation function to AVG
SELECT
    c_custkey,
    c_name,
    AVG(l_extendedprice * (1 - l_discount)) AS avg_revenue,
    c_acctbal,
    n_name,
    c_address,
    c_phone,
    c_comment
FROM
    customer,
    orders,
    lineitem,
    nation
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1994-01-01' + INTERVAL '3 month'
    AND l_returnflag = 'R'
    AND c_nationkey = n_nationkey
GROUP BY
    c_custkey,
    c_name,
    c_acctbal,
    c_phone,
    n_name,
    c_address,
    c_comment
ORDER BY
    avg_revenue DESC
LIMIT 20;

-- Query 4: Change the GROUP BY columns
SELECT
    c_custkey,
    c_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    c_acctbal,
    n_name
FROM
    customer,
    orders,
    lineitem,
    nation
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1994-01-01' + INTERVAL '3 month'
    AND l_returnflag = 'R'
    AND c_nationkey = n_nationkey
GROUP BY
    c_custkey,
    c_name,
    c_acctbal,
    n_name
ORDER BY
    revenue DESC
LIMIT 20;

-- Query 5: Add a new filter in the WHERE clause
SELECT
    c_custkey,
    c_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    c_acctbal,
    n_name,
    c_address,
    c_phone,
    c_comment
FROM
    customer,
    orders,
    lineitem,
    nation
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1994-01-01' + INTERVAL '3 month'
    AND l_returnflag = 'R'
    AND c_nationkey = n_nationkey
    AND c_acctbal > 5000 -- New filter condition
GROUP BY
    c_custkey,
    c_name,
    c_acctbal,
    c_phone,
    n_name,
    c_address,
    c_comment
ORDER BY
    revenue DESC
LIMIT 20;

-- Query 6: Change the JOIN condition to use explicit JOIN syntax
SELECT
    c_custkey,
    c_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    c_acctbal,
    n_name,
    c_address,
    c_phone,
    c_comment
FROM
    customer
JOIN
    orders ON c_custkey = o_custkey
JOIN
    lineitem ON l_orderkey = o_orderkey
JOIN
    nation ON c_nationkey = n_nationkey
WHERE
    o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1994-01-01' + INTERVAL '3 month'
    AND l_returnflag = 'R'
GROUP BY
    c_custkey,
    c_name,
    c_acctbal,
    c_phone,
    n_name,
    c_address,
    c_comment
ORDER BY
    revenue DESC
LIMIT 20;

-- Query 7: Change the SELECT columns
SELECT
    c_custkey,
    c_name,
    SUM(l_extendedprice * (1 - l_discount)) AS total_revenue,
    n_name
FROM
    customer,
    orders,
    lineitem,
    nation
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1994-01-01' + INTERVAL '3 month'
    AND l_returnflag = 'R'
    AND c_nationkey = n_nationkey
GROUP BY
    c_custkey,
    c_name,
    n_name
ORDER BY
    total_revenue DESC
LIMIT 20;

-- Query 9: Add an additional JOIN with another table
SELECT
    c_custkey,
    c_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    c_acctbal,
    n_name,
    c_address,
    c_phone,
    c_comment
FROM
    customer
JOIN
    orders ON c_custkey = o_custkey
JOIN
    lineitem ON l_orderkey = o_orderkey
JOIN
    nation ON c_nationkey = n_nationkey
JOIN
    region ON n_regionkey = r_regionkey
WHERE
    o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1994-01-01' + INTERVAL '3 month'
    AND l_returnflag = 'R'
    AND r_name = 'ASIA' -- Added new join and filter
GROUP BY
    c_custkey,
    c_name,
    c_acctbal,
    c_phone,
    n_name,
    c_address,
    c_comment
ORDER BY
    revenue DESC
LIMIT 20;

-- Query 10: Change the LIMIT clause to retrieve more rows
SELECT
    c_custkey,
    c_name,
    SUM(l_extendedprice * (1 - l_discount)) AS revenue,
    c_acctbal,
    n_name,
    c_address,
    c_phone,
    c_comment
FROM
    customer,
    orders,
    lineitem,
    nation
WHERE
    c_custkey = o_custkey
    AND l_orderkey = o_orderkey
    AND o_orderdate >= DATE '1994-01-01'
    AND o_orderdate < DATE '1994-01-01' + INTERVAL '3 month'
    AND l_returnflag = 'R'
    AND c_nationkey = n_nationkey
GROUP BY
    c_custkey,
    c_name,
    c_acctbal,
    c_phone,
    n_name,
    c_address,
    c_comment
ORDER BY
    revenue DESC
LIMIT 30; -- Increased LIMIT to 30 rows

-- Query 1: Change the nation in the WHERE clause
SELECT
    ps_partkey,
    SUM(ps_supplycost * ps_availqty) AS value
FROM
    partsupp,
    supplier,
    nation
WHERE
    ps_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND n_name = 'FRANCE' -- Changed nation to France
GROUP BY
    ps_partkey
HAVING
    SUM(ps_supplycost * ps_availqty) > (
        SELECT
            SUM(ps_supplycost * ps_availqty) * 0.0001
        FROM
            partsupp,
            supplier,
            nation
        WHERE
            ps_suppkey = s_suppkey
            AND s_nationkey = n_nationkey
            AND n_name = 'FRANCE'
    )
ORDER BY
    value DESC;

-- Query 2: Change the HAVING condition multiplier
SELECT
    ps_partkey,
    SUM(ps_supplycost * ps_availqty) AS value
FROM
    partsupp,
    supplier,
    nation
WHERE
    ps_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND n_name = 'GERMANY'
GROUP BY
    ps_partkey
HAVING
    SUM(ps_supplycost * ps_availqty) > (
        SELECT
            SUM(ps_supplycost * ps_availqty) * 0.001 -- Changed multiplier
        FROM
            partsupp,
            supplier,
            nation
        WHERE
            ps_suppkey = s_suppkey
            AND s_nationkey = n_nationkey
            AND n_name = 'GERMANY'
    )
ORDER BY
    value DESC;

-- Query 3: Add an additional filter in the WHERE clause
SELECT
    ps_partkey,
    SUM(ps_supplycost * ps_availqty) AS value
FROM
    partsupp,
    supplier,
    nation
WHERE
    ps_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND n_name = 'GERMANY'
    AND ps_availqty > 1000 -- Added filter condition
GROUP BY
    ps_partkey
HAVING
    SUM(ps_supplycost * ps_availqty) > (
        SELECT
            SUM(ps_supplycost * ps_availqty) * 0.0001
        FROM
            partsupp,
            supplier,
            nation
        WHERE
            ps_suppkey = s_suppkey
            AND s_nationkey = n_nationkey
            AND n_name = 'GERMANY'
    )
ORDER BY
    value DESC;

-- Query 4: Change the SELECT columns
SELECT
    ps_partkey,
    AVG(ps_supplycost * ps_availqty) AS avg_value -- Changed to AVG instead of SUM
FROM
    partsupp,
    supplier,
    nation
WHERE
    ps_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND n_name = 'GERMANY'
GROUP BY
    ps_partkey
HAVING
    AVG(ps_supplycost * ps_availqty) > (
        SELECT
            SUM(ps_supplycost * ps_availqty) * 0.0001
        FROM
            partsupp,
            supplier,
            nation
        WHERE
            ps_suppkey = s_suppkey
            AND s_nationkey = n_nationkey
            AND n_name = 'GERMANY'
    )
ORDER BY
    avg_value DESC;

-- Query 5: Change the aggregation function in the HAVING clause
SELECT
    ps_partkey,
    SUM(ps_supplycost * ps_availqty) AS value
FROM
    partsupp,
    supplier,
    nation
WHERE
    ps_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND n_name = 'GERMANY'
GROUP BY
    ps_partkey
HAVING
    AVG(ps_supplycost * ps_availqty) > (
        SELECT
            SUM(ps_supplycost * ps_availqty) * 0.0001
        FROM
            partsupp,
            supplier,
            nation
        WHERE
            ps_suppkey = s_suppkey
            AND s_nationkey = n_nationkey
            AND n_name = 'GERMANY'
    )
ORDER BY
    value DESC;

-- Query 6: Change the ORDER BY clause
SELECT
    ps_partkey,
    SUM(ps_supplycost * ps_availqty) AS value
FROM
    partsupp,
    supplier,
    nation
WHERE
    ps_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND n_name = 'GERMANY'
GROUP BY
    ps_partkey
HAVING
    SUM(ps_supplycost * ps_availqty) > (
        SELECT
            SUM(ps_supplycost * ps_availqty) * 0.0001
        FROM
            partsupp,
            supplier,
            nation
        WHERE
            ps_suppkey = s_suppkey
            AND s_nationkey = n_nationkey
            AND n_name = 'GERMANY'
    )
ORDER BY
    ps_partkey ASC; -- Changed ORDER BY to ascending ps_partkey

-- Query 7: Remove the HAVING clause and change WHERE conditions
SELECT
    ps_partkey,
    SUM(ps_supplycost * ps_availqty) AS value
FROM
    partsupp,
    supplier,
    nation
WHERE
    ps_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND n_name = 'GERMANY'
    AND ps_availqty > 500 -- Changed filter condition
GROUP BY
    ps_partkey
ORDER BY
    value DESC;

-- Query 8: Add a new JOIN and change grouping
SELECT
    ps_partkey,
    SUM(ps_supplycost * ps_availqty) AS value
FROM
    partsupp
JOIN
    supplier ON ps_suppkey = s_suppkey
JOIN
    nation ON s_nationkey = n_nationkey
JOIN
    region ON n_regionkey = r_regionkey
WHERE
    r_name = 'EUROPE' -- Added new join and filter
GROUP BY
    ps_partkey
HAVING
    SUM(ps_supplycost * ps_availqty) > (
        SELECT
            SUM(ps_supplycost * ps_availqty) * 0.0001
        FROM
            partsupp
            JOIN supplier ON ps_suppkey = s_suppkey
            JOIN nation ON s_nationkey = n_nationkey
            JOIN region ON n_regionkey = r_regionkey
        WHERE
            r_name = 'EUROPE'
    )
ORDER BY
    value DESC;

-- Query 9: Change the main table in the FROM clause
SELECT
    ps_partkey,
    SUM(ps_supplycost * ps_availqty) AS value
FROM
    partsupp,
    supplier,
    nation,
    region
WHERE
    ps_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND n_name = 'GERMANY'
    AND n_regionkey = r_regionkey -- Added region filter directly in WHERE clause
GROUP BY
    ps_partkey
HAVING
    SUM(ps_supplycost * ps_availqty) > (
        SELECT
            SUM(ps_supplycost * ps_availqty) * 0.0001
        FROM
            partsupp,
            supplier,
            nation,
            region
        WHERE
            ps_suppkey = s_suppkey
            AND s_nationkey = n_nationkey
            AND n_name = 'GERMANY'
            AND n_regionkey = r_regionkey
    )
ORDER BY
    value DESC;

-- Query 10: Change the SELECT and ORDER BY columns
SELECT
    ps_suppkey,
    SUM(ps_supplycost * ps_availqty) AS value
FROM
    partsupp,
    supplier,
    nation
WHERE
    ps_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND n_name = 'GERMANY'
GROUP BY
    ps_suppkey
HAVING
    SUM(ps_supplycost * ps_availqty) > (
        SELECT
            SUM(ps_supplycost * ps_availqty) * 0.0001
        FROM
            partsupp,
            supplier,
            nation
        WHERE
            ps_suppkey = s_suppkey
            AND s_nationkey = n_nationkey
            AND n_name = 'GERMANY'
    )
ORDER BY
    value DESC;

-- Query 1: Change ship modes in the IN clause
SELECT
    l_shipmode,
    SUM(
        CASE
            WHEN o_orderpriority = '1-URGENT' OR o_orderpriority = '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS high_line_count,
    SUM(
        CASE
            WHEN o_orderpriority <> '1-URGENT' AND o_orderpriority <> '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS low_line_count
FROM
    orders,
    lineitem
WHERE
    o_orderkey = l_orderkey
    AND l_shipmode IN ('AIR', 'RAIL') -- Changed ship modes
    AND l_commitdate < l_receiptdate
    AND l_shipdate < l_commitdate
    AND l_receiptdate >= DATE '1994-01-01'
    AND l_receiptdate < DATE '1994-01-01' + INTERVAL '1 year'
GROUP BY
    l_shipmode
ORDER BY
    l_shipmode;

-- Query 2: Adjust date range for l_receiptdate
SELECT
    l_shipmode,
    SUM(
        CASE
            WHEN o_orderpriority = '1-URGENT' OR o_orderpriority = '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS high_line_count,
    SUM(
        CASE
            WHEN o_orderpriority <> '1-URGENT' AND o_orderpriority <> '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS low_line_count
FROM
    orders,
    lineitem
WHERE
    o_orderkey = l_orderkey
    AND l_shipmode IN ('MAIL', 'SHIP')
    AND l_commitdate < l_receiptdate
    AND l_shipdate < l_commitdate
    AND l_receiptdate >= DATE '1993-01-01' -- Adjusted start date
    AND l_receiptdate < DATE '1993-01-01' + INTERVAL '1 year' -- Adjusted end date
GROUP BY
    l_shipmode
ORDER BY
    l_shipmode;

-- Query 3: Change order priority conditions in the CASE statements
SELECT
    l_shipmode,
    SUM(
        CASE
            WHEN o_orderpriority = '1-URGENT' OR o_orderpriority = '3-MEDIUM' THEN 1 -- Changed priority condition
            ELSE 0
        END
    ) AS high_line_count,
    SUM(
        CASE
            WHEN o_orderpriority <> '1-URGENT' AND o_orderpriority <> '3-MEDIUM' THEN 1 -- Changed priority condition
            ELSE 0
        END
    ) AS low_line_count
FROM
    orders,
    lineitem
WHERE
    o_orderkey = l_orderkey
    AND l_shipmode IN ('MAIL', 'SHIP')
    AND l_commitdate < l_receiptdate
    AND l_shipdate < l_commitdate
    AND l_receiptdate >= DATE '1994-01-01'
    AND l_receiptdate < DATE '1994-01-01' + INTERVAL '1 year'
GROUP BY
    l_shipmode
ORDER BY
    l_shipmode;

-- Query 4: Remove the l_commitdate < l_receiptdate condition
SELECT
    l_shipmode,
    SUM(
        CASE
            WHEN o_orderpriority = '1-URGENT' OR o_orderpriority = '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS high_line_count,
    SUM(
        CASE
            WHEN o_orderpriority <> '1-URGENT' AND o_orderpriority <> '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS low_line_count
FROM
    orders,
    lineitem
WHERE
    o_orderkey = l_orderkey
    AND l_shipmode IN ('MAIL', 'SHIP')
    AND l_shipdate < l_commitdate -- Removed condition
    AND l_receiptdate >= DATE '1994-01-01'
    AND l_receiptdate < DATE '1994-01-01' + INTERVAL '1 year'
GROUP BY
    l_shipmode
ORDER BY
    l_shipmode;

-- Query 5: Change the grouping to include o_orderpriority
SELECT
    l_shipmode,
    o_orderpriority, -- Added o_orderpriority to grouping
    SUM(
        CASE
            WHEN o_orderpriority = '1-URGENT' OR o_orderpriority = '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS high_line_count,
    SUM(
        CASE
            WHEN o_orderpriority <> '1-URGENT' AND o_orderpriority <> '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS low_line_count
FROM
    orders,
    lineitem
WHERE
    o_orderkey = l_orderkey
    AND l_shipmode IN ('MAIL', 'SHIP')
    AND l_commitdate < l_receiptdate
    AND l_shipdate < l_commitdate
    AND l_receiptdate >= DATE '1994-01-01'
    AND l_receiptdate < DATE '1994-01-01' + INTERVAL '1 year'
GROUP BY
    l_shipmode, o_orderpriority -- Adjusted grouping
ORDER BY
    l_shipmode;

-- Query 6: Change the ORDER BY to descending order of high_line_count
SELECT
    l_shipmode,
    SUM(
        CASE
            WHEN o_orderpriority = '1-URGENT' OR o_orderpriority = '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS high_line_count,
    SUM(
        CASE
            WHEN o_orderpriority <> '1-URGENT' AND o_orderpriority <> '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS low_line_count
FROM
    orders,
    lineitem
WHERE
    o_orderkey = l_orderkey
    AND l_shipmode IN ('MAIL', 'SHIP')
    AND l_commitdate < l_receiptdate
    AND l_shipdate < l_commitdate
    AND l_receiptdate >= DATE '1994-01-01'
    AND l_receiptdate < DATE '1994-01-01' + INTERVAL '1 year'
GROUP BY
    l_shipmode
ORDER BY
    high_line_count DESC; -- Changed ORDER BY to high_line_count descending

-- Query 7: Add a new condition to the WHERE clause
SELECT
    l_shipmode,
    SUM(
        CASE
            WHEN o_orderpriority = '1-URGENT' OR o_orderpriority = '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS high_line_count,
    SUM(
        CASE
            WHEN o_orderpriority <> '1-URGENT' AND o_orderpriority <> '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS low_line_count
FROM
    orders,
    lineitem
WHERE
    o_orderkey = l_orderkey
    AND l_shipmode IN ('MAIL', 'SHIP')
    AND l_commitdate < l_receiptdate
    AND l_shipdate < l_commitdate
    AND l_receiptdate >= DATE '1994-01-01'
    AND l_receiptdate < DATE '1994-01-01' + INTERVAL '1 year'
    AND o_orderpriority = '1-URGENT' -- Added new condition
GROUP BY
    l_shipmode
ORDER BY
    l_shipmode;

-- Query 8: Change the COUNT in CASE statements to SUM
SELECT
    l_shipmode,
    SUM(
        CASE
            WHEN o_orderpriority = '1-URGENT' OR o_orderpriority = '2-HIGH' THEN l_quantity
            ELSE 0
        END
    ) AS high_line_count,
    SUM(
        CASE
            WHEN o_orderpriority <> '1-URGENT' AND o_orderpriority <> '2-HIGH' THEN l_quantity
            ELSE 0
        END
    ) AS low_line_count
FROM
    orders,
    lineitem
WHERE
    o_orderkey = l_orderkey
    AND l_shipmode IN ('MAIL', 'SHIP')
    AND l_commitdate < l_receiptdate
    AND l_shipdate < l_commitdate
    AND l_receiptdate >= DATE '1994-01-01'
    AND l_receiptdate < DATE '1994-01-01' + INTERVAL '1 year'
GROUP BY
    l_shipmode
ORDER BY
    l_shipmode;

-- Query 10: Change the date range for l_receiptdate
SELECT
    l_shipmode,
    SUM(
        CASE
            WHEN o_orderpriority = '1-URGENT' OR o_orderpriority = '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS high_line_count,
    SUM(
        CASE
            WHEN o_orderpriority <> '1-URGENT' AND o_orderpriority <> '2-HIGH' THEN 1
            ELSE 0
        END
    ) AS low_line_count
FROM
    orders,
    lineitem
WHERE
    o_orderkey = l_orderkey
    AND l_shipmode IN ('MAIL', 'SHIP')
    AND l_commitdate < l_receiptdate
    AND l_shipdate < l_commitdate
    AND l_receiptdate >= DATE '1993-01-01' -- Changed start date
    AND l_receiptdate < DATE '1993-01-01' + INTERVAL '1 year' -- Changed end date
GROUP BY
    l_shipmode
ORDER BY
    l_shipmode;

-- Query 1: Change the LIKE condition in CASE statement
SELECT
    100.00 * SUM(
        CASE
            WHEN p_type LIKE 'ECONOMY%' THEN l_extendedprice * (1 - l_discount) -- Changed LIKE condition
            ELSE 0
        END
    ) / SUM(l_extendedprice * (1 - l_discount)) AS promo_revenue
FROM
    lineitem,
    part
WHERE
    l_partkey = p_partkey
    AND l_shipdate >= DATE '1994-09-01'
    AND l_shipdate < DATE '1994-09-01' + INTERVAL '1 month';

-- Query 2: Adjust date range for l_shipdate
SELECT
    100.00 * SUM(
        CASE
            WHEN p_type LIKE 'PROMO%' THEN l_extendedprice * (1 - l_discount)
            ELSE 0
        END
    ) / SUM(l_extendedprice * (1 - l_discount)) AS promo_revenue
FROM
    lineitem,
    part
WHERE
    l_partkey = p_partkey
    AND l_shipdate >= DATE '1993-09-01' -- Adjusted start date
    AND l_shipdate < DATE '1993-09-01' + INTERVAL '1 month'; -- Adjusted end date

-- Query 3: Change the division to calculate a different metric
SELECT
    100.00 * SUM(
        CASE
            WHEN p_type LIKE 'PROMO%' THEN l_extendedprice * (1 - l_discount)
            ELSE 0
        END
    ) / COUNT(*) AS promo_revenue_percentage -- Changed division to use COUNT(*)
FROM
    lineitem,
    part
WHERE
    l_partkey = p_partkey
    AND l_shipdate >= DATE '1994-09-01'
    AND l_shipdate < DATE '1994-09-01' + INTERVAL '1 month';

-- Query 4: Remove the LIKE condition in CASE statement
SELECT
    100.00 * SUM(
        CASE
            WHEN p_type = 'ECONOMY' THEN l_extendedprice * (1 - l_discount) -- Removed LIKE condition
            ELSE 0
        END
    ) / SUM(l_extendedprice * (1 - l_discount)) AS promo_revenue
FROM
    lineitem,
    part
WHERE
    l_partkey = p_partkey
    AND l_shipdate >= DATE '1994-09-01'
    AND l_shipdate < DATE '1994-09-01' + INTERVAL '1 month';

-- Query 5: Change the aggregation to MAX instead of SUM
SELECT
    100.00 * MAX(
        CASE
            WHEN p_type LIKE 'PROMO%' THEN l_extendedprice * (1 - l_discount)
            ELSE 0
        END
    ) / SUM(l_extendedprice * (1 - l_discount)) AS promo_revenue_max -- Changed aggregation to MAX
FROM
    lineitem,
    part
WHERE
    l_partkey = p_partkey
    AND l_shipdate >= DATE '1994-09-01'
    AND l_shipdate < DATE '1994-09-01' + INTERVAL '1 month';

-- Query 6: Add an additional condition in the WHERE clause
SELECT
    100.00 * SUM(
        CASE
            WHEN p_type LIKE 'PROMO%' THEN l_extendedprice * (1 - l_discount)
            ELSE 0
        END
    ) / SUM(l_extendedprice * (1 - l_discount)) AS promo_revenue
FROM
    lineitem,
    part
WHERE
    l_partkey = p_partkey
    AND l_shipdate >= DATE '1994-09-01'
    AND l_shipdate < DATE '1994-09-01' + INTERVAL '1 month'
    AND p_brand = 'BrandX'; -- Added additional condition

-- Query 7: Change the CASE condition to include a new category
SELECT
    100.00 * SUM(
        CASE
            WHEN p_type LIKE 'PROMO%' OR p_type LIKE 'DISCOUNT%' THEN l_extendedprice * (1 - l_discount) -- Changed CASE condition
            ELSE 0
        END
    ) / SUM(l_extendedprice * (1 - l_discount)) AS promo_revenue
FROM
    lineitem,
    part
WHERE
    l_partkey = p_partkey
    AND l_shipdate >= DATE '1994-09-01'
    AND l_shipdate < DATE '1994-09-01' + INTERVAL '1 month';

-- Query 8: Change the LIKE condition to a NOT LIKE condition
SELECT
    100.00 * SUM(
        CASE
            WHEN p_type NOT LIKE 'PROMO%' THEN l_extendedprice * (1 - l_discount) -- Changed LIKE to NOT LIKE condition
            ELSE 0
        END
    ) / SUM(l_extendedprice * (1 - l_discount)) AS promo_revenue_not_promo
FROM
    lineitem,
    part
WHERE
    l_partkey = p_partkey
    AND l_shipdate >= DATE '1994-09-01'
    AND l_shipdate < DATE '1994-09-01' + INTERVAL '1 month';

-- Query 9: Change the division to SUM(l_quantity) instead of SUM(l_extendedprice)
SELECT
    100.00 * SUM(
        CASE
            WHEN p_type LIKE 'PROMO%' THEN l_extendedprice * (1 - l_discount)
            ELSE 0
        END
    ) / SUM(l_quantity) AS promo_revenue_per_quantity -- Changed division to SUM(l_quantity)
FROM
    lineitem,
    part
WHERE
    l_partkey = p_partkey
    AND l_shipdate >= DATE '1994-09-01'
    AND l_shipdate < DATE '1994-09-01' + INTERVAL '1 month';

-- Query 10: Change the division to SUM(l_discount) instead of SUM(l_extendedprice * (1 - l_discount))
SELECT
    100.00 * SUM(
        CASE
            WHEN p_type LIKE 'PROMO%' THEN l_extendedprice * (1 - l_discount)
            ELSE 0
        END
    ) / SUM(l_discount) AS promo_revenue_per_discount -- Changed division to SUM(l_discount)
FROM
    lineitem,
    part
WHERE
    l_partkey = p_partkey
    AND l_shipdate >= DATE '1994-09-01'
    AND l_shipdate < DATE '1994-09-01' + INTERVAL '1 month';

-- Query 1: Change p_brand condition to '='
SELECT
    p_brand,
    p_type,
    p_size,
    COUNT(DISTINCT ps_suppkey) AS supplier_cnt
FROM
    partsupp,
    part
WHERE
    p_partkey = ps_partkey
    AND p_brand = 'Brand#34' -- Changed to '=' condition
    AND p_type NOT LIKE 'TYPE%'
    AND p_size IN (1, 2, 3, 4, 5, 6, 7, 8)
    AND ps_suppkey NOT IN (
        SELECT
            s_suppkey
        FROM
            supplier
        WHERE
            s_comment LIKE '%Customer%Complaints%'
    )
GROUP BY
    p_brand,
    p_type,
    p_size
ORDER BY
    supplier_cnt DESC,
    p_brand,
    p_type,
    p_size;

-- Query 2: Change p_type condition to LIKE
SELECT
    p_brand,
    p_type,
    p_size,
    COUNT(DISTINCT ps_suppkey) AS supplier_cnt
FROM
    partsupp,
    part
WHERE
    p_partkey = ps_partkey
    AND p_brand <> 'Brand#34'
    AND p_type LIKE 'TYPE%' -- Changed to LIKE condition
    AND p_size IN (1, 2, 3, 4, 5, 6, 7, 8)
    AND ps_suppkey NOT IN (
        SELECT
            s_suppkey
        FROM
            supplier
        WHERE
            s_comment LIKE '%Customer%Complaints%'
    )
GROUP BY
    p_brand,
    p_type,
    p_size
ORDER BY
    supplier_cnt DESC,
    p_brand,
    p_type,
    p_size;

-- Query 3: Add an additional size in p_size condition
SELECT
    p_brand,
    p_type,
    p_size,
    COUNT(DISTINCT ps_suppkey) AS supplier_cnt
FROM
    partsupp,
    part
WHERE
    p_partkey = ps_partkey
    AND p_brand <> 'Brand#34'
    AND p_type NOT LIKE 'TYPE%'
    AND p_size IN (1, 2, 3, 4, 5, 6, 7, 8, 9) -- Added additional size
    AND ps_suppkey NOT IN (
        SELECT
            s_suppkey
        FROM
            supplier
        WHERE
            s_comment LIKE '%Customer%Complaints%'
    )
GROUP BY
    p_brand,
    p_type,
    p_size
ORDER BY
    supplier_cnt DESC,
    p_brand,
    p_type,
    p_size;

-- Query 4: Change the NOT IN subquery condition
SELECT
    p_brand,
    p_type,
    p_size,
    COUNT(DISTINCT ps_suppkey) AS supplier_cnt
FROM
    partsupp,
    part
WHERE
    p_partkey = ps_partkey
    AND p_brand <> 'Brand#34'
    AND p_type NOT LIKE 'TYPE%'
    AND p_size IN (1, 2, 3, 4, 5, 6, 7, 8)
    AND ps_suppkey IN ( -- Changed to IN condition
        SELECT
            s_suppkey
        FROM
            supplier
        WHERE
            s_comment NOT LIKE '%Customer%Complaints%' -- Changed to NOT LIKE condition
    )
GROUP BY
    p_brand,
    p_type,
    p_size
ORDER BY
    supplier_cnt DESC,
    p_brand,
    p_type,
    p_size;

-- Query 5: Remove p_size condition
SELECT
    p_brand,
    p_type,
    p_size,
    COUNT(DISTINCT ps_suppkey) AS supplier_cnt
FROM
    partsupp,
    part
WHERE
    p_partkey = ps_partkey
    AND p_brand <> 'Brand#34'
    AND p_type NOT LIKE 'TYPE%'
    -- Removed p_size condition
    AND ps_suppkey NOT IN (
        SELECT
            s_suppkey
        FROM
            supplier
        WHERE
            s_comment LIKE '%Customer%Complaints%'
    )
GROUP BY
    p_brand,
    p_type,
    p_size
ORDER BY
    supplier_cnt DESC,
    p_brand,
    p_type,
    p_size;

-- Query 6: Change the ORDER BY to p_type DESC
SELECT
    p_brand,
    p_type,
    p_size,
    COUNT(DISTINCT ps_suppkey) AS supplier_cnt
FROM
    partsupp,
    part
WHERE
    p_partkey = ps_partkey
    AND p_brand <> 'Brand#34'
    AND p_type NOT LIKE 'TYPE%'
    AND p_size IN (1, 2, 3, 4, 5, 6, 7, 8)
    AND ps_suppkey NOT IN (
        SELECT
            s_suppkey
        FROM
            supplier
        WHERE
            s_comment LIKE '%Customer%Complaints%'
    )
GROUP BY
    p_brand,
    p_type,
    p_size
ORDER BY
    p_type DESC, -- Changed ORDER BY to p_type DESC
    supplier_cnt DESC,
    p_brand,
    p_size;

-- Query 7: Change the GROUP BY to p_brand only
SELECT
    p_brand,
    MAX(p_type) AS p_type,
    MAX(p_size) AS p_size,
    COUNT(DISTINCT ps_suppkey) AS supplier_cnt
FROM
    partsupp,
    part
WHERE
    p_partkey = ps_partkey
    AND p_brand <> 'Brand#34'
    AND p_type NOT LIKE 'TYPE%'
    AND p_size IN (1, 2, 3, 4, 5, 6, 7, 8)
    AND ps_suppkey NOT IN (
        SELECT
            s_suppkey
        FROM
            supplier
        WHERE
            s_comment LIKE '%Customer%Complaints%'
    )
GROUP BY
    p_brand
ORDER BY
    supplier_cnt DESC,
    p_brand;

-- Query 8: Change the aggregation to MIN for p_size
SELECT
    p_brand,
    p_type,
    MIN(p_size) AS p_size, -- Changed aggregation to MIN for p_size
    COUNT(DISTINCT ps_suppkey) AS supplier_cnt
FROM
    partsupp,
    part
WHERE
    p_partkey = ps_partkey
    AND p_brand <> 'Brand#34'
    AND p_type NOT LIKE 'TYPE%'
    AND p_size IN (1, 2, 3, 4, 5, 6, 7, 8)
    AND ps_suppkey NOT IN (
        SELECT
            s_suppkey
        FROM
            supplier
        WHERE
            s_comment LIKE '%Customer%Complaints%'
    )
GROUP BY
    p_brand,
    p_type
ORDER BY
    supplier_cnt DESC,
    p_brand,
    p_type;

-- Query 10: Add a new condition to the WHERE clause for p_brand
SELECT
    p_brand,
    p_type,
    p_size,
    COUNT(DISTINCT ps_suppkey) AS supplier_cnt
FROM
    partsupp,
    part
WHERE
    p_partkey = ps_partkey
    AND (p_brand <> 'Brand#34' OR p_brand = 'Brand#56') -- Added new condition for p_brand
    AND p_type NOT LIKE 'TYPE%'
    AND p_size IN (1, 2, 3, 4, 5, 6, 7, 8)
    AND ps_suppkey NOT IN (
        SELECT
            s_suppkey
        FROM
            supplier
        WHERE
            s_comment LIKE '%Customer%Complaints%'
    )
GROUP BY
    p_brand,
    p_type,
    p_size
ORDER BY
    supplier_cnt DESC,
    p_brand,
    p_type,
    p_size;

-- Query 1: Change the HAVING condition to SUM(l_quantity) > 500
SELECT
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice,
    SUM(l_quantity)
FROM
    customer,
    orders,
    lineitem
WHERE
    o_orderkey IN (
        SELECT
            l_orderkey
        FROM
            lineitem
        GROUP BY
            l_orderkey
        HAVING
            SUM(l_quantity) > 500 -- Changed HAVING condition to SUM(l_quantity) > 500
    )
    AND c_custkey = o_custkey
    AND o_orderkey = l_orderkey
GROUP BY
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice
ORDER BY
    o_totalprice DESC,
    o_orderdate;

-- Query 2: Change the ORDER BY to o_orderdate ASC
SELECT
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice,
    SUM(l_quantity)
FROM
    customer,
    orders,
    lineitem
WHERE
    o_orderkey IN (
        SELECT
            l_orderkey
        FROM
            lineitem
        GROUP BY
            l_orderkey
        HAVING
            SUM(l_quantity) > 300 -- Standard value from TPC-H
    )
    AND c_custkey = o_custkey
    AND o_orderkey = l_orderkey
GROUP BY
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice
ORDER BY
    o_orderdate ASC; -- Changed ORDER BY to o_orderdate ASC

-- Query 3: Add a new condition to the WHERE clause for o_totalprice > 5000
SELECT
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice,
    SUM(l_quantity)
FROM
    customer,
    orders,
    lineitem
WHERE
    o_orderkey IN (
        SELECT
            l_orderkey
        FROM
            lineitem
        GROUP BY
            l_orderkey
        HAVING
            SUM(l_quantity) > 300 -- Standard value from TPC-H
    )
    AND c_custkey = o_custkey
    AND o_orderkey = l_orderkey
    AND o_totalprice > 5000 -- Added new condition for o_totalprice > 5000
GROUP BY
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice
ORDER BY
    o_totalprice DESC,
    o_orderdate;

-- Query 6: Remove the HAVING condition
SELECT
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice,
    SUM(l_quantity)
FROM
    customer,
    orders,
    lineitem
WHERE
    o_orderkey IN (
        SELECT
            l_orderkey
        FROM
            lineitem
        GROUP BY
            l_orderkey
    )
    AND c_custkey = o_custkey
    AND o_orderkey = l_orderkey
GROUP BY
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice
ORDER BY
    o_totalprice DESC,
    o_orderdate;

-- Query 7: Change the INNER JOIN to use explicit JOIN syntax
SELECT
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice,
    SUM(l_quantity)
FROM
    customer
JOIN
    orders ON c_custkey = o_custkey
JOIN
    lineitem ON o_orderkey = l_orderkey
WHERE
    o_orderkey IN (
        SELECT
            l_orderkey
        FROM
            lineitem
        GROUP BY
            l_orderkey
        HAVING
            SUM(l_quantity) > 300 -- Standard value from TPC-H
    )
GROUP BY
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice
ORDER BY
    o_totalprice DESC,
    o_orderdate;

-- Query 8: Add an additional condition for o_orderdate
SELECT
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice,
    SUM(l_quantity)
FROM
    customer,
    orders,
    lineitem
WHERE
    o_orderkey IN (
        SELECT
            l_orderkey
        FROM
            lineitem
        GROUP BY
            l_orderkey
        HAVING
            SUM(l_quantity) > 300 -- Standard value from TPC-H
    )
    AND c_custkey = o_custkey
    AND o_orderkey = l_orderkey
    AND o_orderdate >= DATE '1995-01-01' -- Additional condition for o_orderdate
GROUP BY
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice
ORDER BY
    o_totalprice DESC,
    o_orderdate;

-- Query 9: Change the SUM(l_quantity) aggregation to AVG(l_quantity)
SELECT
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice,
    AVG(l_quantity) AS avg_quantity -- Changed aggregation to AVG(l_quantity)
FROM
    customer,
    orders,
    lineitem
WHERE
    o_orderkey IN (
        SELECT
            l_orderkey
        FROM
            lineitem
        GROUP BY
            l_orderkey
        HAVING
            SUM(l_quantity) > 300 -- Standard value from TPC-H
    )
    AND c_custkey = o_custkey
    AND o_orderkey = l_orderkey
GROUP BY
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice
ORDER BY
    o_totalprice DESC,
    o_orderdate;

-- Query 10: Change the ORDER BY to c_custkey
SELECT
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice,
    SUM(l_quantity)
FROM
    customer,
    orders,
    lineitem
WHERE
    o_orderkey IN (
        SELECT
            l_orderkey
        FROM
            lineitem
        GROUP BY
            l_orderkey
        HAVING
            SUM(l_quantity) > 300 -- Standard value from TPC-H
    )
    AND c_custkey = o_custkey
    AND o_orderkey = l_orderkey
GROUP BY
    c_name,
    c_custkey,
    o_orderkey,
    o_orderdate,
    o_totalprice
ORDER BY
    c_custkey;

-- Query 1: Change p_brand and p_container values
SELECT
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    lineitem,
    part
WHERE
    (
        (p_partkey = l_partkey
            AND p_brand = 'Brand#15' -- Changed p_brand value
            AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 35 AND 45) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#24' -- Changed p_brand value
            AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK') -- Standard values from TPC-H
            AND l_quantity BETWEEN 30 AND 40) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#33' -- Changed p_brand value
            AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 25 AND 35) -- Standard value from TPC-H
    );

-- Query 2: Change l_quantity range
SELECT
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    lineitem,
    part
WHERE
    (
        (p_partkey = l_partkey
            AND p_brand = 'Brand#12' -- Standard value from TPC-H
            AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 30 AND 40) -- Changed l_quantity range
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#23' -- Standard value from TPC-H
            AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK') -- Standard values from TPC-H
            AND l_quantity BETWEEN 35 AND 45) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#34' -- Standard value from TPC-H
            AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 25 AND 35) -- Standard value from TPC-H
    );

-- Query 3: Add an additional p_brand condition
SELECT
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    lineitem,
    part
WHERE
    (
        (p_partkey = l_partkey
            AND p_brand = 'Brand#12' -- Standard value from TPC-H
            AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 25 AND 35) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#23' -- Standard value from TPC-H
            AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK') -- Standard values from TPC-H
            AND l_quantity BETWEEN 30 AND 40) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#35' -- Added new p_brand value
            AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 35 AND 45) -- Standard value from TPC-H
    );

-- Query 4: Change p_container values
SELECT
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    lineitem,
    part
WHERE
    (
        (p_partkey = l_partkey
            AND p_brand = 'Brand#12' -- Standard value from TPC-H
            AND p_container IN ('MED CASE', 'MED BOX', 'MED PACK', 'MED PKG') -- Changed p_container values
            AND l_quantity BETWEEN 25 AND 35) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#23' -- Standard value from TPC-H
            AND p_container IN ('SM BAG', 'SM BOX', 'SM PKG', 'SM PACK') -- Changed p_container values
            AND l_quantity BETWEEN 30 AND 40) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#34' -- Standard value from TPC-H
            AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 35 AND 45) -- Standard value from TPC-H
    );

-- Query 5: Change p_brand and p_container values
SELECT
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    lineitem,
    part
WHERE
    (
        (p_partkey = l_partkey
            AND p_brand = 'Brand#15' -- Changed p_brand value
            AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 35 AND 45) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#24' -- Changed p_brand value
            AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK') -- Standard values from TPC-H
            AND l_quantity BETWEEN 30 AND 40) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#33' -- Changed p_brand value
            AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 25 AND 35) -- Standard value from TPC-H
    );

-- Query 6: Change l_quantity range
SELECT
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    lineitem,
    part
WHERE
    (
        (p_partkey = l_partkey
            AND p_brand = 'Brand#12' -- Standard value from TPC-H
            AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 30 AND 40) -- Changed l_quantity range
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#23' -- Standard value from TPC-H
            AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK') -- Standard values from TPC-H
            AND l_quantity BETWEEN 35 AND 45) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#34' -- Standard value from TPC-H
            AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 25 AND 35) -- Standard value from TPC-H
    );

-- Query 7: Add an additional p_brand condition
SELECT
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    lineitem,
    part
WHERE
    (
        (p_partkey = l_partkey
            AND p_brand = 'Brand#12' -- Standard value from TPC-H
            AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 25 AND 35) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#23' -- Standard value from TPC-H
            AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK') -- Standard values from TPC-H
            AND l_quantity BETWEEN 30 AND 40) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#35' -- Added new p_brand value
            AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 35 AND 45) -- Standard value from TPC-H
    );

-- Query 8: Change p_container values
SELECT
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    lineitem,
    part
WHERE
    (
        (p_partkey = l_partkey
            AND p_brand = 'Brand#12' -- Standard value from TPC-H
            AND p_container IN ('MED CASE', 'MED BOX', 'MED PACK', 'MED PKG') -- Changed p_container values
            AND l_quantity BETWEEN 25 AND 35) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#23' -- Standard value from TPC-H
            AND p_container IN ('SM BAG', 'SM BOX', 'SM PKG', 'SM PACK') -- Changed p_container values
            AND l_quantity BETWEEN 30 AND 40) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#34' -- Standard value from TPC-H
            AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 35 AND 45) -- Standard value from TPC-H
    );

-- Query 9: Change p_brand and p_container values
SELECT
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    lineitem,
    part
WHERE
    (
        (p_partkey = l_partkey
            AND p_brand = 'Brand#15' -- Changed p_brand value
            AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 35 AND 45) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#24' -- Changed p_brand value
            AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK') -- Standard values from TPC-H
            AND l_quantity BETWEEN 30 AND 40) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#33' -- Changed p_brand value
            AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 25 AND 35) -- Standard value from TPC-H
    );

-- Query 10: Change l_quantity range
SELECT
    SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM
    lineitem,
    part
WHERE
    (
        (p_partkey = l_partkey
            AND p_brand = 'Brand#12' -- Standard value from TPC-H
            AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 30 AND 40) -- Changed l_quantity range
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#23' -- Standard value from TPC-H
            AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK') -- Standard values from TPC-H
            AND l_quantity BETWEEN 35 AND 45) -- Standard value from TPC-H
        OR
        (p_partkey = l_partkey
            AND p_brand = 'Brand#34' -- Standard value from TPC-H
            AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG') -- Standard values from TPC-H
            AND l_quantity BETWEEN 25 AND 35) -- Standard value from TPC-H
    );
