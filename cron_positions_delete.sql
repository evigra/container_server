DELETE FROM tc_positions tp 
WHERE
    to_char(now() - INTERVAL '2' MINUTE, 'YYYY-MM-DD HH24:MI:SS') >
    to_char(tp.servertime, 'YYYY-MM-DD HH24:MI:SS')
