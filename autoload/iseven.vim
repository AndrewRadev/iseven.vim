let s:cache = {}

function iseven#CheckEven(number)
  let api_response = s:GetApiResponse(a:number)
  if empty(api_response)
    return
  endif

  if has_key(api_response, "error")
    echoerr "Error: " . api_response["error"]
    return
  endif

  if api_response["iseven"] == v:true
    echomsg "It's even: " . a:number
  else
    echomsg "It's not even: " . a:number
  endif

  call s:ShowAd(api_response)
endfunction

function iseven#CheckOdd(number)
  let api_response = s:GetApiResponse(a:number)
  if empty(api_response)
    return
  endif

  if has_key(api_response, "error")
    echoerr "Error: " . api_response["error"]
    return
  endif

  if api_response["iseven"] == v:true
    echomsg "It's not odd: " . a:number
  else
    echomsg "It's odd: " . a:number
  endif

  call s:ShowAd(api_response)
endfunction

function s:GetApiResponse(number)
  let number = str2nr(a:number)

  if trim(a:number) != '0' && number == 0
    echoerr "Doesn't look like a valid number: " . a:number
    return {}
  endif

  if g:iseven_cache_enabled && has_key(s:cache, number)
    let response = s:cache[number]
  else
    let output = trim(system('curl -s https://api.isevenapi.xyz/api/iseven/' . number))
    if v:shell_error
      echoerr "Error connecting to API: " . output
      return {}
    endif

    let response = json_decode(output)
  endif

  if g:iseven_cache_enabled
    let s:cache[number] = response
  endif

  return response
endfunction

function s:ShowAd(api_response)
  let api_response = a:api_response

  if has_key(api_response, "ad") && exists('*popup_notification')
    call popup_notification(api_response["ad"], {
          \ 'title':    "Ad",
          \ 'pos':      'topright',
          \ 'col':      9999,
          \ 'maxwidth': 50,
          \ 'wrap':     1,
          \ })
  endif
endfunction
