select
    products_id
    ,date_date
    ,orders_id
    ,revenue
    ,quantity
    ,CAST(purchase_price as FLOAT64)
    ,round(S.QUANTITY*CAST(p.purchase_price AS FLOAT64),2) AS purchase_cost
    ,ROUND(s.revenue - round(S.QUANTITY*CAST(p.purchase_price AS FLOAT64),2),2) AS margin

FROM {{ref ("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__product")}} p
ON s.pdt_id=p.products_id