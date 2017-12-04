json.array! @notifications do |notification|
  json.id notification.id
  json.action notification.action
  if notification.notifiable.is_a?(Topic)
    json.url messageboard_path(id: notification.notifiable.id,
                               course: notification.notifiable.course_id,
                               p_order: 'newest')
  elsif notification.notifiable.is_a?(User)
    json.url user_path('show', id: notification.notifiable.id)
  else
    json.url root_path
  end
end
