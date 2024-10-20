SELECT C.course_id, C.title, S.sec_id,T.start_time
FROM course C 
INNER JOIN section S 
ON S.course_id = C.course_id
INNER JOIN time_slot T
ON s.time_slot_id = T.time_slot_id
WHERE S.semester = 'Fall'
AND S.year = 2022;