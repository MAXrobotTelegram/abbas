local function run (msg, matches)
  if matches [1]: lower () == "github>" then
    local dat = https.request ( "https://api.github.com/repos/" ..matches [2])
    local jdat = JSON.decode (dat)
    if jdat.message then
      return "address is not correct."
      end
    local base = "curl 'https://codeload.github.com/"..matches[2].."/zip/master'"
    local data = io.popen (base): read ( '* all')
    f = io.open ( "file / github.zip", "w +")
    f: write (data)
    f: close ()
    return send_document ( "chat # id" .. msg.to.id, "file / github.zip", ok_cb, false)
  else
    local dat = https.request ( "https://api.github.com/repos/" ..matches [2])
    local jdat = JSON.decode (dat)
    if jdat.message then
      return "address is not correct."
      end
    local res = https.request (jdat.owner.url)
    local jres = JSON.decode (res)
    send_photo_from_url ( "chat # id" .. msg.to.id, jdat.owner.avatar_url)
    return "View account: \ n"
      .. "Account name:" .. (jres.name or "-----") .. "\ n"
      .. "Username:" ..jdat.owner.login .. "\ n"
      .. "Name:" .. (jres.company or "-----") .. "\ n"
      .. "Website:" .. (jres.blog or "-----") .. "\ n"
      .. "Email:" .. (jres.email or "-----") .. "\ n"
      .. "Location:" .. (jres.location or "-----") .. "\ n"
      .. "The number of projects:" ..jres.public_repos .. "\ n"
      .. "The number of followers:" ..jres.followers .. "\ n"
      .. "The number followed by:" ..jres.following .. "\ n"
      .. "On the construction account:" ..jres.created_at .. "\ n"
      .. "Biography:" .. (jres.bio or "-----") .. "\ n \ n"
      .. "View project: \ n"
      .. "Project Name:" ..jdat.name .. "\ n"
      .. "GitHub page:" ..jdat.html_url .. "\ n"
      .. "Pkgsrc:" ..jdat.clone_url .. "\ n"
      .. "Blog of the project:" .. (jdat.homepage or "-----") .. "\ n"
      .. "Created:" ..jdat.created_at .. "\ n"
      .. "Last Updated on:" .. (jdat.updated_at or "-----") .. "\ n"
      .. "Programming language:" .. (jdat.language or "-----") .. "\ n"
      .. "Size script:" ..jdat.size .. "\ n"
      .. "Stars:" ..jdat.stargazers_count .. "\ n"
      .. "Hits:" ..jdat.watchers_count .. "\ n"
      .. "Split:" ..jdat.forks_count .. "\ n"
      .. "Customer:" ..jdat.subscribers_count .. "\ n"
      .. "About project: \ n" .. (jdat.description or "-----") .. "\ n"
  end
end

return {
  description = "Github Informations",
  usagehtm = '<tr> <td align = "center"> github project / account </ td> <td align = "right"> address GitHub for project / account Enter <br> example: github shayansoft / umbrella < / td> </ tr> '
  .. '<Tr> <td align = "center"> github> Project / Account </ td> <td align = "right"> With this command, you can download the source code to the project. Enter the address projects like high command </ td> </ tr> ',
  usage = {
    "Github (account / proje): View project and account",
    "Github> (account / proje): Download source",
    },
  patterns = {
    "^ ([Gg] ithub>) (. *)",
    "^ ([Gg] ithub) (. *)",
    },
  run = run
}
