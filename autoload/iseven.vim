let s:cache = {}

function iseven#Run(number)
  let number = str2nr(a:number)

  if trim(a:number) != '0' && number == 0
    echoerr "Doesn't look like a valid number: " . a:number
    return
  endif

  if g:iseven_cache_enabled && has_key(s:cache, number)
    let response = s:cache[number]
  else
    let output = trim(system('curl -s https://api.isevenapi.xyz/api/iseven/' . number))
    if v:shell_error
      echoerr "Error connecting to API: " . output
      return
    endif

    let response = json_decode(output)
  endif

  if g:iseven_cache_enabled
    let s:cache[number] = response
  endif

  if has_key(response, "error")
    echoerr "Error: " . response["error"]
    return
  endif

  if response["iseven"] == v:true
    echomsg "It's even: " . number
  else
    echomsg "It's not even: " . number
  endif

  if has_key(response, "ad") && exists('*popup_notification')
    call popup_notification(response["ad"], {
          \ 'title':    "Ad",
          \ 'pos':      'topright',
          \ 'col':      9999,
          \ 'maxwidth': 50,
          \ 'wrap':     1,
          \ })
  endif
endfunction
