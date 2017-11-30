json.array! @notifications do |notification|
  json.id notification.id
  json.action notification.action
  json.notifiable do #notification.notifiable
    json.type "#{notification.notifiable.title}"
  end
  json.url messageboard_path(id: notification.notifiable.id,
                             course: notification.notifiable.course_id,
                             p_order: 'newest')
end
