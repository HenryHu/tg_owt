add_library(libevent OBJECT)
init_target(libevent)
add_library(tg_owt::libevent ALIAS libevent)

set(libevent_loc ${webrtc_loc}/base/third_party/libevent)

target_compile_definitions(libevent
PRIVATE
    HAVE_CONFIG_H
)

if (APPLE)
    target_include_directories(libevent
    PRIVATE
        ${libevent_loc}/mac
    )
else()
    target_include_directories(libevent
    PRIVATE
        ${libevent_loc}/freebsd
    )
endif()

nice_target_sources(libevent ${libevent_loc}
PRIVATE
    buffer.c
    evbuffer.c
    evdns.c
    event.c
    event_tagging.c
    evrpc.c
    evutil.c
    http.c
    kqueue.c
    log.c
    poll.c
    select.c
    signal.c
    strlcpy.c
)

target_include_directories(libevent
PRIVATE
    ${webrtc_loc}
    ${libevent_loc}
)
