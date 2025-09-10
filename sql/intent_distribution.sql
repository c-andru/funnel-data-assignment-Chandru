-- Intention Distribution  
WITH intents AS (
  SELECT COALESCE(NULLIF(TRIM(detected_intent), ''), 'unknown') AS intent,
         COUNT(*) AS cnt
  FROM messages
  GROUP BY 1
),
total AS (
  SELECT SUM(cnt) AS total_cnt FROM intents
)
SELECT intent, cnt AS count,
       ROUND(100.0 * cnt / total_cnt, 2) AS pct_of_total
FROM intents, total
ORDER BY count DESC;

-- Top 2 Intents
WITH intents AS (
  SELECT COALESCE(NULLIF(TRIM(detected_intent), ''), 'unknown') AS intent,
         COUNT(*) AS cnt
  FROM messages
  GROUP BY 1
)
SELECT intent, cnt AS count
FROM intents
ORDER BY count DESC
LIMIT 2;
