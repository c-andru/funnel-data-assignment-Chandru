-- cancellation Sla 
WITH base AS (
  SELECT order_id,
         created_at,
         canceled_at,
         (CASE WHEN canceled_at IS NOT NULL THEN 1 ELSE 0 END) AS canceled,
         (CASE WHEN canceled_at IS NOT NULL
                   AND TIMESTAMPDIFF(SECOND, created_at, canceled_at) > 3600
               THEN 1 ELSE 0 END) AS violation
  FROM orders
)
SELECT COUNT(*) AS total_orders,
       SUM(canceled) AS canceled,
       SUM(violation) AS violations,
       ROUND(100.0 * SUM(violation) / NULLIF(SUM(canceled),0),2) AS violation_rate_pct
FROM base;



