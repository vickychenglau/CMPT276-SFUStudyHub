json.array! @notifications do |notification|
  json.id notification.id
  json.action notification.action
  if notification.notifiable.is_a?(Topic)
    json.url messageboard_path(id: notification.notifiable.id,
                               course: notification.notifiable.course_id,
                               p_order: 'newest')
  else
    json.url root_path
  end
end
