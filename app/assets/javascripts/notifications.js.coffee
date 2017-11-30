class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")

    if @notifications.length > 0
      @handleSuccess @notifications.data("notifications")
      $("[data-behavior='notifications-link']").on "click", @handleClick

      setInterval (=>
        @getNewNotifications()
      ), 5000

  getNewNotifications: ->
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )

  handleClick: (e) =>
    $.ajax(
      url: "/notifications/mark_as_read"
      dataType: "JSON"
      method: "POST"
      console.log("clicked?");
      success: ->
        console.log("click success!");
        $("[data-behavior='unread-count']").text(0)
    )

  handleSuccess: (data) =>
    if data.length > 0
      items = $.map data, (notification) ->
        "<a class='dropdown-item' href='#{notification.url}'> #{notification.action} #{notification.notifiable.type} <br/></a>"

      $("[data-behavior='unread-count']").text(items.length)
      $("[data-behavior='notification-items']").html(items)
    else
      $("[data-behavior='unread-count']").text(0)

jQuery ->
  new Notifications
