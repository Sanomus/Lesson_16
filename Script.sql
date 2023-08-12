SELECT sorted.name, sorted.user_id, MAX(my_count)
FROM( SELECT airbnb_user.name, airbnb_user.user_id, COUNT(*) as my_count FROM airbnb_user
INNER JOIN room_state ON airbnb_user.user_id = room_state.guest_id
GROUP BY airbnb_user.user_id) AS sorted
GROUP BY sorted.name, sorted.user_id
ORDER BY max DESC LIMIT 1;