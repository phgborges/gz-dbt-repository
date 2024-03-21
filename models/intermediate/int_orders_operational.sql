SELECT
    o.orders_id,
    o.date_date,
    ROUND(CAST(o.margin AS FLOAT64) + s.shipping_fee - (CAST(s.logcost AS FLOAT64) + CAST(s.ship_cost AS FLOAT64)), 2) AS operational_margin,
    o.quantity,
    o.revenue,
    o.purchase_cost,
    o.margin,
    s.shipping_fee,
    s.logcost,
    s.ship_cost
FROM 
    {{ref("int_orders_margin")}} o
LEFT JOIN 
    {{ref("stg_raw__ship")}} s 
ON 
    o.orders_id = s.orders_id
ORDER BY 
    o.orders_id DESC
