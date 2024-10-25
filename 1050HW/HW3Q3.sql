SELECT 
    S.ID, S.name
FROM
    student S,
    takes T
WHERE
    S.id = T.id AND S.dept_name = 'DSI'
        AND T.course_id = 'Data1050'
        AND T.semester = 'Fall'
        AND T.year = 2023
