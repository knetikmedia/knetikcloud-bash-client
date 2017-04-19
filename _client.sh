#compdef 

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! swagger-codegen (https://github.com/swagger-api/swagger-codegen)
# ! FROM SWAGGER SPECIFICATION IN JSON.
# !
# ! Based on: https://github.com/Valodim/zsh-curl-completion/blob/master/_curl
# !
# ! Generated on: 2017-04-19T17:12:20.612-04:00
# !
# !
# ! Installation:
# !
# ! Copy the _ file to any directory under FPATH
# ! environment variable (echo $FPATH)
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


local curcontext="$curcontext" state line ret=1
typeset -A opt_args

typeset -A mime_type_abbreviations
# text/*
mime_type_abbreviations[text]="text/plain"
mime_type_abbreviations[html]="text/html"
mime_type_abbreviations[md]="text/x-markdown"
mime_type_abbreviations[csv]="text/csv"
mime_type_abbreviations[css]="text/css"
mime_type_abbreviations[rtf]="text/rtf"
# application/*
mime_type_abbreviations[json]="application/json"
mime_type_abbreviations[xml]="application/xml"
mime_type_abbreviations[yaml]="application/yaml"
mime_type_abbreviations[js]="application/javascript"
mime_type_abbreviations[bin]="application/octet-stream"
mime_type_abbreviations[rdf]="application/rdf+xml"
# image/*
mime_type_abbreviations[jpg]="image/jpeg"
mime_type_abbreviations[png]="image/png"
mime_type_abbreviations[gif]="image/gif"
mime_type_abbreviations[bmp]="image/bmp"
mime_type_abbreviations[tiff]="image/tiff"

#
# Generate zsh completion string list for abbreviated mime types
#
get_mime_type_completions() {
    typeset -a result
    result=()
    for k in "${(@k)mime_type_abbreviations}"; do
        value=$mime_type_abbreviations[${k}]
        #echo $value
        result+=( "${k}[${value}]" )
        #echo $result
    done
    echo "$result"
}

#
# cURL crypto engines completion function
#
_curl_crypto_engine() {
    local vals
    vals=( ${${(f)"$(curl --engine list)":gs/ /}[2,$]} )
    _describe -t outputs 'engines' vals && return 0
}

#
# cURL post data completion functions=
#
_curl_post_data() {

    # don't do anything further if this is raw content
    compset -P '=' && _message 'raw content' && return 0

    # complete filename or stdin for @ syntax
    compset -P '*@' && {
        local expl
        _description files expl stdin
        compadd "$expl[@]" - "-"
        _files
        return 0
    }

    # got a name already? expecting data.
    compset -P '*=' && _message 'data value' && return 0

    # otherwise, name (or @ or =) should be specified
    _message 'data name' && return 0

}


local arg_http arg_ftp arg_other arg_proxy arg_crypto arg_connection arg_auth arg_input arg_output

# HTTP Arguments
arg_http=(''\
  {-0,--http1.0}'[force use of use http 1.0 instead of 1.1]' \
  {-b,--cookie}'[pass data to http server as cookie]:data or file' \
  {-c,--cookie-jar}'[specify cookie file]:file name:_files' \
  {-d,--data}'[send specified data as HTTP POST data]:data:{_curl_post_data}' \
  '--data-binary[post HTTP POST data without any processing]:data:{_curl_post_data}' \
  '--data-urlencode[post HTTP POST data, with url encoding]:data:{_curl_post_data}' \
  {-f,--fail}'[enable failfast behavior for server errors]' \
  '*'{-F,--form}'[add POST form data]:name=content' \
  {-G,--get}'[use HTTP GET even with data (-d, --data, --data-binary)]' \
  '*'{-H,--header}'[specify an extra header]:header' \
  '--ignore-content-length[ignore Content-Length header]' \
  {-i,--include}'[include HTTP header in the output]' \
  {-j,--junk-session-cookies}'[discard all session cookies]' \
  {-e,--referer}'[send url as referer]:referer url:_urls' \
  {-L,--location}'[follow Location headers on http 3XX response]' \
  '--location-trusted[like --location, but allows sending of auth data to redirected hosts]' \
  '--max-redirs[set maximum number of redirection followings allowed]:number' \
  {-J,--remote-header-name}'[use Content-Disposition for output file name]' \
  {-O,--remote-name}'[write to filename parsed from url instead of stdout]' \
  '--post301[do not convert POST to GET after following 301 Location response (follow RFC 2616/10.3.2)]' \
  '--post302[do not convert POST to GET after following 302 Location response (follow RFC 2616/10.3.2)]' \
  )

# FTP arguments
arg_ftp=(\
  {-a,--append}'[append to target file instead of overwriting (FTP/SFTP)]' \
  '--crlf[convert LF to CRLF in upload]' \
  '--disable-eprt[disable use of EPRT and LPRT for active FTP transfers]' \
  '--disable-epsv[disable use of EPSV for passive FTP transfers]' \
  '--ftp-account[account data (FTP)]:data' \
  '--ftp-alternative-to-user[command to send when USER and PASS commands fail (FTP)]:command' \
  '--ftp-create-dirs[create paths remotely if it does not exist]' \
  '--ftp-method[ftp method to use to reach a file (FTP)]:method:(multicwd ocwd singlecwd)' \
  '--ftp-pasv[use passive mode for the data connection (FTP)]' \
  '--ftp-skip-pasv-ip[do not use the ip the server suggests for PASV]' \
  '--form-string[like --form, but do not parse content]:name=string' \
  '--ftp-pret[send PRET before PASV]' \
  '--ftp-ssl-ccc[use clear command channel (CCC) after authentication (FTP)]' \
  '--ftp-ssl-ccc-mode[sets the CCC mode (FTP)]:mode:(active passive)' \
  '--ftp-ssl-control[require SSL/TLS for FTP login, clear for transfer]' \
  {-l,--list-only}'[list names only when listing directories (FTP)]' \
  {-P,--ftp-port}'[use active mode, tell server to connect to specified address or interface (FTP]:address' \
  '*'{-Q,--quote}'[send arbitrary command to the remote server before transfer (FTP/SFTP)]:command' \
  )

# Other Protocol arguments
arg_other=(\
  '--mail-from[specify From: address]:address' \
  '--mail-rcpt[specify email recipient for SMTP, may be given multiple times]:address' \
  {-t,--telnet-option}'[pass options to telnet protocol]:opt=val' \
  '--tftp-blksize[set tftp BLKSIZE option]:value' \
  )

# Proxy arguments
arg_proxy=(\
  '--noproxy[list of hosts to connect directly to instead of through proxy]:no-proxy-list' \
  {-p,--proxytunnel}'[tunnel non-http protocols through http proxy]' \
  {-U,--proxy-user}'[specify the user name and password to use for proxy authentication]:user:password' \
  '--proxy-anyauth[use any authentication method for proxy, default to most secure]' \
  '--proxy-basic[use HTTP Basic authentication for proxy]' \
  '--proxy-digest[use http digest authentication for proxy]' \
  '--proxy-negotiate[enable GSS-Negotiate authentication for proxy]' \
  '--proxy-ntlm[enable ntlm authentication for proxy]' \
  '--proxy1.0[use http 1.0 proxy]:proxy url' \
  {-x,--proxy}'[use specified proxy]:proxy url' \
  '--socks5-gssapi-service[change service name for socks server]:servicename' \
  '--socks5-gssapi-nec[allow unprotected exchange of protection mode negotiation]' \
  )

# Crypto arguments
arg_crypto=(\
  {-1,--tlsv1}'[Forces curl to use TLS version 1 when negotiating with a remote TLS server.]' \
  {-2,--sslv2}'[Forces curl to use SSL version 2 when negotiating with a remote SSL server.]' \
  {-3,--sslv3}'[Forces curl to use SSL version 3 when negotiating with a remote SSL server.]' \
  '--ciphers[specifies which cipher to use for the ssl connection]:list of ciphers' \
  '--crlfile[specify file with revoked certificates]:file' \
  '--delegation[set delegation policy to use with GSS/kerberos]:delegation policy:(none policy always)' \
  {-E,--cert}'[use specified client certificate]:certificate file:_files' \
  '--engine[use selected OpenSSL crypto engine]:ssl crypto engine:{_curl_crypto_engine}' \
  '--egd-file[set ssl entropy gathering daemon socket]:entropy socket:_files' \
  '--cert-type[specify certificate type (PEM, DER, ENG)]:certificate type:(PEM DER ENG)' \
  '--cacert[specify certificate file to verify the peer with]:CA certificate:_files' \
  '--capath[specify a search path for certificate files]:CA certificate directory:_directories' \
  '--hostpubmd5[check remote hosts public key]:md5 hash' \
  {-k,--insecure}'[allow ssl to perform insecure ssl connections (ie, ignore certificate)]' \
  '--key[ssl/ssh private key file name]:key file:_files' \
  '--key-type[ssl/ssh private key file type]:file type:(PEM DER ENG)' \
  '--pubkey[ssh public key file]:pubkey file:_files' \
  '--random-file[set source of random data for ssl]:random source:_files' \
  '--no-sessionid[disable caching of ssl session ids]' \
  '--pass:phrase[passphrase for ssl/ssh private key]' \
  '--ssl[try to use ssl/tls for connection, if available]' \
  '--ssl-reqd[try to use ssl/tls for connection, fail if unavailable]' \
  '--tlsauthtype[set TLS authentication type (only SRP supported!)]:authtype' \
  '--tlsuser[set username for TLS authentication]:user' \
  '--tlspassword[set password for TLS authentication]:password' \
  )

# Connection arguments
arg_connection=(\
  {-4,--ipv4}'[prefer ipv4]' \
  {-6,--ipv6}'[prefer ipv6, if available]' \
  {-B,--use-ascii}'[use ascii mode]' \
  '--compressed[request a compressed transfer]' \
  '--connect-timeout[timeout for connection phase]:seconds' \
  {-I,--head}'[fetch http HEAD only (HTTP/FTP/FILE]' \
  '--interface[work on a specific interface]:name' \
  '--keepalive-time[set time to wait before sending keepalive probes]:seconds' \
  '--limit-rate[specify maximum transfer rate]:speed' \
  '--local-port[set preferred number or range of local ports to use]:num' \
  {-N,--no-buffer}'[disable buffering of the output stream]' \
  '--no-keepalive[disable use of keepalive messages in TCP connections]' \
  '--raw[disable all http decoding and pass raw data]' \
  '--resolve[provide a custom address for a specific host and port pair]:host\:port\:address' \
  '--retry[specify maximum number of retries for transient errors]:num' \
  '--retry-delay[specify delay between retries]:seconds' \
  '--retry-max-time[maximum time to spend on retries]:seconds' \
  '--tcp-nodelay[turn on TCP_NODELAY option]' \
  {-y,--speed-time}'[specify time to abort after if download is slower than speed-limit]:time' \
  {-Y,--speed-limit}'[specify minimum speed for --speed-time]:speed' \
  )

# Authentication arguments
arg_auth=(\
  '--anyauth[use any authentication method, default to most secure]' \
  '--basic[use HTTP Basic authentication]' \
  '--ntlm[enable ntlm authentication]' \
  '--digest[use http digest authentication]' \
  '--krb[use kerberos authentication]:auth:(clear safe confidential private)' \
  '--negotiate[enable GSS-Negotiate authentication]' \
  {-n,--netrc}'[scan ~/.netrc for login data]' \
  '--netrc-optional[like --netrc, but does not make .netrc usage mandatory]' \
  '--netrc-file[like --netrc, but specify file to use]:netrc file:_files' \
  '--tr-encoding[request compressed transfer-encoding]' \
  {-u,--user}'[specify user name and password for server authentication]:user\:password' \
  )

# Input arguments
arg_input=(\
  {-C,--continue-at}'[resume at offset ]:offset' \
  {-g,--globoff}'[do not glob {}\[\] letters]' \
  '--max-filesize[maximum filesize to download, fail for bigger files]:bytes' \
  '--proto[specify allowed protocols for transfer]:protocols' \
  '--proto-redir[specify allowed protocols for transfer after a redirect]:protocols' \
  {-r,--range}'[set range of bytes to request (HTTP/FTP/SFTP/FILE)]:range' \
  {-R,--remote-time}'[use timestamp of remote file for local file]' \
  {-T,--upload-file}'[transfer file to remote url (using PUT for HTTP)]:file to upload:_files' \
  '--url[specify a URL to fetch (multi)]:url:_urls' \
  {-z,--time-cond}'[request downloaded file to be newer than date or given reference file]:date expression' \
  )

# Output arguments
arg_output=(\
  '--create-dirs[create local directory hierarchy as needed]' \
  {-D,--dump-header}'[write protocol headers to file]:dump file:_files' \
  {-o,--output}'[write to specified file instead of stdout]:output file:_files' \
  {--progress-bar,-\#}'[display progress as a simple progress bar]' \
  {-\#,--progress-bar}'[Make curl display progress as a simple progress bar instead of the standard, more informational, meter.]' \
  {-R,--remote-time}'[use timestamp of remote file for local file]' \
  '--raw[disable all http decoding and pass raw data]' \
  {-s,--silent}'[silent mode, do not show progress meter or error messages]' \
  {-S,--show-error}'[show errors in silent mode]' \
  '--stderr[redirect stderr to specified file]:output file:_files' \
  '--trace[enable full trace dump of all incoming and outgoing data]:trace file:_files' \
  '--trace-ascii[enable full trace dump of all incoming and outgoing data, without hex data]:trace file:_files' \
  '--trace-time[prepends a time stamp to each trace or verbose line that curl displays]' \
  {-v,--verbose}'[output debug info]' \
  {-w,--write-out}'[specify message to output on successful operation]:format string' \
  '--xattr[store some file metadata in extended file attributes]' \
  {-X,--request}'[specifies request method for HTTP server]:method:(GET POST PUT DELETE HEAD OPTIONS TRACE CONNECT PATCH LINK UNLINK)' \
  )

_arguments -C -s $arg_http $arg_ftp $arg_other $arg_crypto $arg_connection $arg_auth $arg_input $arg_output \
  {-M,--manual}'[Print manual]' \
  '*'{-K,--config}'[Use other config file to read arguments from]:config file:_files' \
  '--libcurl[output libcurl code for the operation to file]:output file:_files' \
  {-m,--max-time}'[Limit total time of operation]:seconds' \
  {-s,--silent}'[Silent mode, do not show progress meter or error messages]' \
  {-S,--show-error}'[Show errors in silent mode]' \
  '--stderr[Redirect stderr to specified file]:output file:_files' \
  '-q[Do not read settings from .curlrc (must be first option)]' \
  {-h,--help}'[Print help and list of operations]' \
  {-V,--version}'[Print service API version]' \
  '--about[Print the information about service]' \
  '--host[Specify the host URL]':URL:_urls \
  '--dry-run[Print out the cURL command without executing it]' \
  {-ac,--accept}'[Set the Accept header in the request]: :{_values "Accept mime type" $(get_mime_type_completions)}' \
  {-ct,--content-type}'[Set the Content-type header in request]: :{_values "Content mime type" $(get_mime_type_completions)}' \
  '1: :->ops' \
  '*:: :->args' \
  && ret=0


case $state in
  ops)
    # Operations
    _values "Operations" \
            "getOAuthToken[Get access token]"             "createActivity[Create an activity]" \
            "createActivityOccurrence[Create a new activity occurrence]" \
            "createActivityTemplate[Create a activity template]" \
            "deleteActivity[Delete an activity]" \
            "deleteActivityTemplate[Delete a activity template]" \
            "getActivities[List activity definitions]" \
            "getActivity[Get a single activity]" \
            "getActivityTemplate[Get a single activity template]" \
            "getActivityTemplates[List and search activity templates]" \
            "setActivityOccurrenceResults[Sets the status of an activity occurrence to FINISHED and logs metrics]" \
            "updateActivity[Update an activity]" \
            "updateActivityOccurrence[Updated the status of an activity occurrence]" \
            "updateActivityTemplate[Update an activity template]"             "getSignedS3URL[Get a signed S3 URL]"             "createClient[Create a new client]" \
            "deleteClient[Delete a client]" \
            "getClient[Get a single client]" \
            "getClientGrantTypes[List available client grant types]" \
            "getClients[List and search clients]" \
            "setClientGrantTypes[Set grant types for a client]" \
            "setClientRedirectUris[Set redirect uris for a client]" \
            "updateClient[Update a client]"             "createPermission[Create a new permission]" \
            "deletePermission[Delete a permission]" \
            "getPermission[Get a single permission]" \
            "getPermissions[List and search permissions]" \
            "updatePermission[Update a permission]"             "createRole[Create a new role]" \
            "deleteRole[Delete a role]" \
            "getClientRoles[Get roles for a client]" \
            "getRole[Get a single role]" \
            "getRoles[List and search roles]" \
            "getUserRoles[Get roles for a user]" \
            "setClientRoles[Set roles for a client]" \
            "setPermissionsForRole[Set permissions for a role]" \
            "setUserRoles[Set roles for a user]" \
            "updateRole[Update a role]"             "deleteToken[Delete a token by username and client id]" \
            "deleteTokens[Delete all tokens by username]" \
            "getToken[Get a single token by username and client id]" \
            "getTokens[List usernames and client ids]"             "getBREActions[Get a list of available actions]"             "createBRECategoryTemplate[Create a BRE category template]" \
            "deleteBRECategoryTemplate[Delete a BRE category template]" \
            "getBRECategories[List categories]" \
            "getBRECategory[Get a single category]" \
            "getBRECategoryTemplate[Get a single BRE category template]" \
            "getBRECategoryTemplates[List and search BRE category templates]" \
            "updateBRECategory[Update a category]" \
            "updateBRECategoryTemplate[Update a BRE category template]"             "sendBREEvent[Fire a new event, based on an existing trigger]"             "getBREExpressions[Get a list of 'lookup' type expressions]"             "createBREGlobal[Create a global definition]" \
            "deleteBREGlobal[Delete a global]" \
            "getBREGlobal[Get a single global definition]" \
            "getBREGlobals[List global definitions]" \
            "updateBREGlobal[Update a global definition]"             "createBRERule[Create a rule]" \
            "deleteBRERule[Delete a rule]" \
            "getBREExpressionAsString[Returns a string representation of the provided expression]" \
            "getBRERule[Get a single rule]" \
            "getBRERules[List rules]" \
            "setBRERule[Enable or disable a rule]" \
            "updateBRERule[Update a rule]"             "createBRETrigger[Create a trigger]" \
            "deleteBRETrigger[Delete a trigger]" \
            "getBRETrigger[Get a single trigger]" \
            "getBRETriggers[List triggers]" \
            "updateBRETrigger[Update a trigger]"             "getBREVariableTypes[Get a list of variable types available]"             "addChallengeToCampaign[Add a challenge to a campaign]" \
            "createCampaign[Create a campaign]" \
            "createCampaignTemplate[Create a campaign template]" \
            "deleteCampaign[Delete a campaign]" \
            "deleteCampaignTemplate[Delete a campaign template]" \
            "getCampaign[Returns a single campaign]" \
            "getCampaignChallenges[List the challenges associated with a campaign]" \
            "getCampaignTemplate[Get a single campaign template]" \
            "getCampaignTemplates[List and search campaign templates]" \
            "getCampaigns[List and search campaigns]" \
            "removeChallengeFromCampaign[Remove a challenge from a campaign]" \
            "updateCampaign[Update a campaign]" \
            "updateCampaignTemplate[Update an campaign template]"             "createChallenge[Create a challenge]" \
            "createChallengeActivity[Create a challenge activity]" \
            "createChallengeActivityTemplate[Create a challenge activity template]" \
            "createChallengeTemplate[Create a challenge template]" \
            "deleteChallenge[Delete a challenge]" \
            "deleteChallengeActivity[Delete a challenge activity]" \
            "deleteChallengeActivityTemplate[Delete a challenge activity template]" \
            "deleteChallengeEvent[Delete a challenge event]" \
            "deleteChallengeTemplate[Delete a challenge template]" \
            "getChallenge[Retrieve a challenge]" \
            "getChallengeActivities[List and search challenge activities]" \
            "getChallengeActivity[Get a single challenge activity]" \
            "getChallengeActivityTemplate[Get a single challenge activity template]" \
            "getChallengeActivityTemplates[List and search challenge activity templates]" \
            "getChallengeEvent[Retrieve a single challenge event details]" \
            "getChallengeEvents[Retrieve a list of challenge events]" \
            "getChallengeTemplate[Get a single challenge template]" \
            "getChallengeTemplates[List and search challenge templates]" \
            "getChallenges[Retrieve a list of challenges]" \
            "updateChallenge[Update a challenge]" \
            "updateChallengeActivity[Update a challenge activity]" \
            "updateChallengeActivityTemplate[Update an challenge activity template]" \
            "updateChallengeTemplate[Update a challenge template]"             "createRewardSet[Create a reward set]" \
            "deleteRewardSet[Delete a reward set]" \
            "getRewardSet[Get a single reward set]" \
            "getRewardSets[List and search reward sets]" \
            "updateRewardSet[Update a reward set]"             "createCategory[Create a new category]" \
            "createCategoryTemplate[Create a category template]" \
            "deleteCategory[Delete an existing category]" \
            "deleteCategoryTemplate[Delete a category template]" \
            "getCategories[List and search categories with optional filters]" \
            "getCategory[Get a single category]" \
            "getCategoryTemplate[Get a single category template]" \
            "getCategoryTemplates[List and search category templates]" \
            "getTags[List all trivia tags in the system]" \
            "updateCategory[Update an existing category]" \
            "updateCategoryTemplate[Update a category template]"             "createConfig[Create a new config]" \
            "deleteConfig[Delete an existing config]" \
            "getConfig[Get a single config]" \
            "getConfigs[List and search configs]" \
            "updateConfig[Update an existing config]"             "createArticle[Create a new article]" \
            "createArticleTemplate[Create an article template]" \
            "deleteArticle[Delete an existing article]" \
            "deleteArticleTemplate[Delete an article template]" \
            "getArticle[Get a single article]" \
            "getArticleTemplate[Get a single article template]" \
            "getArticleTemplates[List and search article templates]" \
            "getArticles[List and search articles]" \
            "updateArticle[Update an existing article]" \
            "updateArticleTemplate[Update an article template]"             "addComment[Add a new comment]" \
            "deleteComment[Delete a comment]" \
            "getComment[Return a comment]" \
            "getComments[Returns a page of comments]" \
            "searchComments[Search the comment index]" \
            "updateComment[Update a comment]"             "answerPoll[Add your vote to a poll]" \
            "createPoll[Create a new poll]" \
            "createPollTemplate[Create a poll template]" \
            "deletePoll[Delete an existing poll]" \
            "deletePollTemplate[Delete a poll template]" \
            "getPoll[Get a single poll]" \
            "getPollAnswer[Get poll answer]" \
            "getPollTemplate[Get a single poll template]" \
            "getPollTemplates[List and search poll templates]" \
            "getPolls[List and search polls]" \
            "updatePoll[Update an existing poll]" \
            "updatePollTemplate[Update a poll template]"             "createCurrency[Create a currency]" \
            "deleteCurrency[Delete a currency]" \
            "getCurrencies[List and search currencies]" \
            "getCurrency[Get a single currency]" \
            "updateCurrency[Update a currency]"             "createDevice[Create a device]" \
            "deleteDevice[Delete a device]" \
            "getDevice[Get a single device]" \
            "getDevices[List and search devices]" \
            "updateDevice[Update a device]"             "addDisposition[Add a new disposition]" \
            "deleteDisposition[Delete a disposition]" \
            "getDisposition[Returns a disposition]" \
            "getDispositionCounts[Returns a list of disposition counts]" \
            "getDispositions[Returns a page of dispositions]"             "createFulfillmentType[Create a fulfillment type]" \
            "deleteFulfillmentType[Delete a fulfillment type]" \
            "getFulfillmentType[Get a single fulfillment type]" \
            "getFulfillmentTypes[List and search fulfillment types]" \
            "updateFulfillmentType[Update a fulfillment type]"             "createAchievement[Create a new achievement definition]" \
            "createAchievementTemplate[Create an achievement template]" \
            "deleteAchievement[Delete an achievement definition]" \
            "deleteAchievementTemplate[Delete an achievement template]" \
            "getAchievement[Get a single achievement definition]" \
            "getAchievementTemplate[Get a single achievement template]" \
            "getAchievementTemplates[List and search achievement templates]" \
            "getAchievementTriggers[Get the list of triggers that can be used to trigger an achievement progress update]" \
            "getAchievements[Get all achievement definitions in the system]" \
            "getDerivedAchievements[Get a list of derived achievements]" \
            "getUserAchievementProgress[Retrieve progress on a given achievement for a given user]" \
            "getUserAchievementsProgress[Retrieve progress on achievements for a given user]" \
            "getUsersAchievementProgress[Retrieve progress on a given achievement for all users]" \
            "getUsersAchievementsProgress[Retrieve progress on achievements for all users]" \
            "incrementAchievementProgress[Increment an achievement progress record for a user]" \
            "setAchievementProgress[Set an achievement progress record for a user]" \
            "updateAchievement[Update an achievement definition]" \
            "updateAchievementTemplate[Update an achievement template]"             "getLeaderboard[Retrieves leaderboard details and paginated entries]" \
            "getLeaderboardRank[Retrieves a specific user entry with rank]" \
            "getLeaderboardStrategies[Get a list of available leaderboard strategy names]"             "createLevel[Create a level schema]" \
            "deleteLevel[Delete a level]" \
            "getLevel[Retrieve a level]" \
            "getLevelTriggers[Get the list of triggers that can be used to trigger a leveling progress update]" \
            "getLevels[List and search levels]" \
            "getUserLevel[Get a user's progress for a given level schema]" \
            "getUserLevels[Get a user's progress for all level schemas]" \
            "incrementProgress[Update or create a leveling progress record for a user]" \
            "setProgress[Set leveling progress for a user]" \
            "updateLevel[Update a level]"             "addMetric[Add a metric]"             "addQuestionAnswers[Add an answer to a question]" \
            "addQuestionTag[Add a tag to a question]" \
            "addTagToQuestionsBatch[Add a tag to a batch of questions]" \
            "createImportJob[Create an import job]" \
            "createQuestion[Create a question]" \
            "createQuestionTemplate[Create a question template]" \
            "deleteImportJob[Delete an import job]" \
            "deleteQuestion[Delete a question]" \
            "deleteQuestionAnswers[Remove an answer from a question]" \
            "deleteQuestionTemplate[Delete a question template]" \
            "getImportJob[Get an import job]" \
            "getImportJobs[Get a list of import job]" \
            "getQuestion[Get a single question]" \
            "getQuestionAnswer[Get an answer for a question]" \
            "getQuestionAnswers[List the answers available for a question]" \
            "getQuestionDeltas[List question deltas in ascending order of updated date]" \
            "getQuestionTags[List the tags for a question]" \
            "getQuestionTemplate[Get a single question template]" \
            "getQuestionTemplates[List and search question templates]" \
            "getQuestions[List and search questions]" \
            "getQuestionsCount[Count questions based on filters]" \
            "processImportJob[Start processing an import job]" \
            "removeQuestionTag[Remove a tag from a question]" \
            "removeTagToQuestionsBatch[Remove a tag from a batch of questions]" \
            "searchQuestionTags[List and search tags by the beginning of the string]" \
            "updateImportJob[Update an import job]" \
            "updateQuestion[Update a question]" \
            "updateQuestionAnswer[Update an answer for a question]" \
            "updateQuestionTemplate[Update a question template]" \
            "updateQuestionsInBulk[Bulk update questions]"             "createInvoice[Create an invoice]" \
            "getFulFillmentStatuses[Lists available fulfillment statuses]" \
            "getInvoice[Retrieve an invoice]" \
            "getInvoiceLogs[List invoice logs]" \
            "getInvoices[Retrieve invoices]" \
            "getPaymentStatuses[Lists available payment statuses]" \
            "payInvoice[Trigger payment of an invoice]" \
            "setExternalRef[Set the external reference of an invoice]" \
            "setInvoiceItemFulfillmentStatus[Set the fulfillment status of an invoice item]" \
            "setOrderNotes[Set the order notes of an invoice]" \
            "setPaymentStatus[Set the payment status of an invoice]" \
            "updateBillingInfo[Set or update billing info]"             "getCountries[Get a list of countries]" \
            "getCountryByGeoLocation[Get the iso3 code of your country]" \
            "getCountryStates[Get a list of a country's states]" \
            "getCurrencyByGeoLocation[Get the currency information of your country]"             "addUserLog[Add a user log entry]" \
            "getBREEventLog[Get an existing BRE event log entry by id]" \
            "getBREEventLogs[Returns a list of BRE event log entries]" \
            "getBREForwardLog[Get an existing forward log entry by id]" \
            "getBREForwardLogs[Returns a list of forward log entries]" \
            "getUserLog[Returns a user log entry by id]" \
            "getUserLogs[Returns a page of user logs entries]"             "addArtist[Adds a new artist in the system]" \
            "createArtistTemplate[Create an artist template]" \
            "deleteArtist[Removes an artist from the system IF no resources are attached to it]" \
            "deleteArtistTemplate[Delete an artist template]" \
            "getArtist[Loads a specific artist details]" \
            "getArtistTemplate[Get a single artist template]" \
            "getArtistTemplates[List and search artist templates]" \
            "getArtists[Search for artists]" \
            "updateArtist[Modifies an artist details]" \
            "updateArtistTemplate[Update an artist template]"             "getModerationReport[Get a flag report]" \
            "getModerationReports[Returns a page of flag reports]" \
            "updateModerationReport[Update a flag report]"             "addUserToVideoWhitelist[Adds a user to a video's whitelist]" \
            "addVideo[Adds a new video in the system]" \
            "addVideoComment[Add a new video comment]" \
            "addVideoContributor[Adds a contributor to a video]" \
            "addVideoFlag[Add a new flag]" \
            "addVideoRelationships[Adds one or more existing videos as related to this one]" \
            "createVideoDisposition[Create a video disposition]" \
            "deleteVideo[Deletes a video from the system if no resources are attached to it]" \
            "deleteVideoComment[Delete a video comment]" \
            "deleteVideoDisposition[Delete a video disposition]" \
            "deleteVideoFlag[Delete a flag]" \
            "deleteVideoRelationship[Delete a video's relationship]" \
            "getUserVideos[Get user videos]" \
            "getVideo[Loads a specific video details]" \
            "getVideoComments[Returns a page of comments for a video]" \
            "getVideoDispositions[Returns a page of dispositions for a video]" \
            "getVideoRelationships[Returns a page of video relationships]" \
            "getVideos[Search videos using the documented filters]" \
            "removeUserFromVideoWhitelist[Removes a user from a video's whitelist]" \
            "removeVideoContributor[Removes a contributor from a video]" \
            "updateVideo[Modifies a video's details]" \
            "updateVideoComment[Update a video comment]" \
            "updateVideoRelationship[Update a video's relationship details]" \
            "viewVideo[Increment a video's view count]"             "sendRawEmail[Send a raw email to one or more users]" \
            "sendRawSMS[Send a raw SMS]" \
            "sendTemplatedEmail[Send a templated email to one or more users]" \
            "sendTemplatedSMS[Send a new templated SMS]"             "createPaymentMethod[Create a new payment method for a user]" \
            "deletePaymentMethod[Delete an existing payment method for a user]" \
            "getPaymentMethod[Get a single payment method for a user]" \
            "getPaymentMethods[Get all payment methods for a user]" \
            "paymentAuthorization[Authorize payment of an invoice for later capture]" \
            "paymentCapture[Capture an existing invoice payment authorization]" \
            "updatePaymentMethod[Update an existing payment method for a user]"             "verifyAppleReceipt[Pay invoice with Apple receipt]"             "handleGooglePayment[Mark an invoice paid with Google]"             "silentPostOptimal[Initiate silent post with Optimal]"             "createPayPalBillingAgreementUrl[Create a PayPal Classic billing agreement for the user]" \
            "createPayPalExpressCheckout[Create a payment token for PayPal express checkout]" \
            "finalizePayPalBillingAgreement[Finalizes a billing agreement after the user has accepted through PayPal]" \
            "finalizePayPalCheckout[Finalizes a payment after the user has completed checkout with PayPal]"             "createStripePaymentMethod[Create a Stripe payment method for a user]" \
            "payStripeInvoice[Pay with a single use token]"             "getTransaction[Get the details for a single transaction]" \
            "getTransactions[List and search transactions]" \
            "refundTransaction[Refund a payment transaction, in full or in part]"             "getUserWallet[Returns the user's wallet for the given currency code]" \
            "getUserWalletTransactions[Retrieve a user's wallet transactions]" \
            "getUserWallets[List all of a user's wallets]" \
            "getWalletBalances[Retrieves a summation of wallet balances by currency code]" \
            "getWalletTransactions[Retrieve wallet transactions across the system]" \
            "getWallets[Retrieve a list of wallets across the system]" \
            "updateWalletBalance[Updates the balance for a user's wallet]"             "createXsollaTokenUrl[Create a payment token that should be used to forward the user to Xsolla so they can complete payment]" \
            "receiveXsollaNotification[Receives payment response from Xsolla]"             "getChallengeEventLeaderboard[Retrieve a challenge event leaderboard details]" \
            "getChallengeEventParticipants[Retrieve a challenge event participant details]"             "getInvoiceReports[Retrieve invoice counts aggregated by time ranges]"             "getItemRevenue[Get item revenue info]" \
            "getRefundRevenue[Get refund revenue info]" \
            "getRevenueByCountry[Get revenue info by country]" \
            "getRevenueByItem[Get revenue info by item]" \
            "getSubscriptionRevenue[Get subscription revenue info]"             "getSubscriptionReports[Get a list of available subscription reports in most recent first order]"             "getUsageByDay[Returns aggregated endpoint usage information by day]" \
            "getUsageByHour[Returns aggregated endpoint usage information by hour]" \
            "getUsageByMinute[Returns aggregated endpoint usage information by minute]" \
            "getUsageByMonth[Returns aggregated endpoint usage information by month]" \
            "getUsageByYear[Returns aggregated endpoint usage information by year]" \
            "getUsageEndpoints[Returns list of endpoints called (method and url)]"             "getUserRegistrations[Get user registration info]"             "addSearchIndex[Add a new object to an index]" \
            "addSearchMappings[Register reference mappings]" \
            "deleteSearchIndex[Delete an object]" \
            "deleteSearchIndexes[Delete all objects in an index]" \
            "searchIndex[Search an index]"             "linkAccounts[Link facebook account]"             "linkAccounts1[Link facebook account]"             "createItemTemplate[Create an item template]" \
            "createStoreItem[Create a store item]" \
            "deleteItemTemplate[Delete an item template]" \
            "deleteStoreItem[Delete a store item]" \
            "getBehaviors[List available item behaviors]" \
            "getItemTemplate[Get a single item template]" \
            "getItemTemplates[List and search item templates]" \
            "getStore[Get a listing of store items]" \
            "getStoreItem[Get a single store item]" \
            "getStoreItems[List and search store items]" \
            "updateItemTemplate[Update an item template]" \
            "updateStoreItem[Update a store item]"             "createBundleItem[Create a bundle item]" \
            "createBundleTemplate[Create a bundle template]" \
            "deleteBundleItem[Delete a bundle item]" \
            "deleteBundleTemplate[Delete a bundle template]" \
            "getBundleItem[Get a single bundle item]" \
            "getBundleTemplate[Get a single bundle template]" \
            "getBundleTemplates[List and search bundle templates]" \
            "updateBundleItem[Update a bundle item]" \
            "updateBundleTemplate[Update a bundle template]"             "createCouponItem[Create a coupon item]" \
            "createCouponTemplate[Create a coupon template]" \
            "deleteCouponItem[Delete a coupon item]" \
            "deleteCouponTemplate[Delete a coupon template]" \
            "getCouponItem[Get a single coupon item]" \
            "getCouponTemplate[Get a single coupon template]" \
            "getCouponTemplates[List and search coupon templates]" \
            "updateCouponItem[Update a coupon item]" \
            "updateCouponTemplate[Update a coupon template]"             "createCatalogSale[Create a sale]" \
            "deleteCatalogSale[Delete a sale]" \
            "getCatalogSale[Get a single sale]" \
            "getCatalogSales[List and search sales]" \
            "updateCatalogSale[Update a sale]"             "createShippingItem[Create a shipping item]" \
            "createShippingTemplate[Create a shipping template]" \
            "deleteShippingItem[Delete a shipping item]" \
            "deleteShippingTemplate[Delete a shipping template]" \
            "getShippingItem[Get a single shipping item]" \
            "getShippingTemplate[Get a single shipping template]" \
            "getShippingTemplates[List and search shipping templates]" \
            "updateShippingItem[Update a shipping item]" \
            "updateShippingTemplate[Update a shipping template]"             "addCustomDiscount[Adds a custom discount to the cart]" \
            "addDiscountToCart[Adds a discount coupon to the cart]" \
            "addItemToCart[Add an item to the cart]" \
            "createCart[Create a cart]" \
            "getCart[Returns the cart with the given GUID]" \
            "getCarts[Get a list of carts]" \
            "getShippable[Returns whether a cart requires shipping]" \
            "getShippingCountries[Get the list of available shipping countries per vendor]" \
            "removeDiscountFromCart[Removes a discount coupon from the cart]" \
            "setCartCurrency[Sets the currency to use for the cart]" \
            "setCartOwner[Sets the owner of a cart if none is set already]" \
            "updateItemInCart[Changes the quantity of an item already in the cart]" \
            "updateShippingAddress[Modifies or sets the order shipping address]"             "createSubscription[Creates a subscription item and associated plans]" \
            "createSubscriptionTemplate[Create a subscription template]" \
            "deleteSubscription[Delete a subscription plan]" \
            "deleteSubscriptionTemplate[Delete a subscription template]" \
            "getSubscription[Retrieve a single subscription item and associated plans]" \
            "getSubscriptionTemplate[Get a single subscription template]" \
            "getSubscriptionTemplates[List and search subscription templates]" \
            "getSubscriptions[List available subscription items and associated plans]" \
            "processSubscriptions[Processes subscriptions and charge dues]" \
            "updateSubscription[Updates a subscription item and associated plans]" \
            "updateSubscriptionTemplate[Update a subscription template]"             "createVendor[Create a vendor]" \
            "createVendorTemplate[Create a vendor template]" \
            "deleteVendor[Delete a vendor]" \
            "deleteVendorTemplate[Delete a vendor template]" \
            "getVendor[Get a single vendor]" \
            "getVendorTemplate[Get a single vendor template]" \
            "getVendorTemplates[List and search vendor templates]" \
            "getVendors[List and search vendors]" \
            "updateVendor[Update a vendor]" \
            "updateVendorTemplate[Update a vendor template]"             "createCountryTax[Create a country tax]" \
            "createStateTax[Create a state tax]" \
            "deleteCountryTax[Delete an existing tax]" \
            "deleteStateTax[Delete an existing state tax]" \
            "getCountryTax[Get a single tax]" \
            "getCountryTaxes[List and search taxes]" \
            "getStateTax[Get a single state tax]" \
            "getStateTaxesForCountries[List and search taxes across all countries]" \
            "getStateTaxesForCountry[List and search taxes within a country]" \
            "updateCountryTax[Create or update a tax]" \
            "updateStateTax[Create or update a state tax]"             "getTemplatePropertyType[Get details for a template property type]" \
            "getTemplatePropertyTypes[List template property types]"             "addUserTag[Add a tag to a user]" \
            "createUserTemplate[Create a user template]" \
            "deleteUserTemplate[Delete a user template]" \
            "getUser[Get a single user]" \
            "getUserTags[List tags for a user]" \
            "getUserTemplate[Get a single user template]" \
            "getUserTemplates[List and search user templates]" \
            "getUsers[List and search users]" \
            "passwordReset[Choose a new password after a reset]" \
            "registerUser[Register a new user]" \
            "removeUserTag[Remove a tag from a user]" \
            "setPassword[Set a user's password]" \
            "startPasswordReset[Reset a user's password]" \
            "updateUser[Update a user]" \
            "updateUserTemplate[Update a user template]"             "createAddress[Create a new address]" \
            "deleteAddress[Delete an address]" \
            "getAddress[Get a single address]" \
            "getAddresses[List and search addresses]" \
            "updateAddress[Update an address]"             "addFriend[Add a friend]" \
            "getFriends[Get friends list]" \
            "getInviteToken[Returns the invite token]" \
            "getInvites[Get pending invites]" \
            "redeemFriendshipToken[Redeem friendship token]" \
            "removeOrDeclineFriend[Remove or decline a friend]"             "addMemberToGroup[Adds a new member to the group]" \
            "createGroup[Create a group]" \
            "createGroupTemplate[Create a group template]" \
            "deleteGroup[Removes a group from the system IF no resources are attached to it]" \
            "deleteGroupTemplate[Delete a group template]" \
            "getGroup[Loads a specific group's details]" \
            "getGroupMember[Get a user from a group]" \
            "getGroupMembers[Lists members of the group]" \
            "getGroupTemplate[Get a single group template]" \
            "getGroupTemplates[List and search group templates]" \
            "getGroupsForUser[List groups a user is in]" \
            "removeGroupMember[Removes a user from a group]" \
            "updateGroup[Update a group]" \
            "updateGroupMemberStatus[Change a user's status]" \
            "updateGroupTemplate[Update a group template]" \
            "updateGroups[List and search groups]"             "addItemToUserInventory[Adds an item to the user inventory]" \
            "checkUserEntitlementItem[Check for access to an item without consuming]" \
            "createEntitlementItem[Create an entitlement item]" \
            "createEntitlementTemplate[Create an entitlement template]" \
            "deleteEntitlementItem[Delete an entitlement item]" \
            "deleteEntitlementTemplate[Delete an entitlement template]" \
            "getEntitlementItem[Get a single entitlement item]" \
            "getEntitlementItems[List and search entitlement items]" \
            "getEntitlementTemplate[Get a single entitlement template]" \
            "getEntitlementTemplates[List and search entitlement templates]" \
            "getUserInventories[List the user inventory entries for a given user]" \
            "getUserInventory[Get an inventory entry]" \
            "getUserInventoryLog[List the log entries for this inventory entry]" \
            "getUsersInventory[List the user inventory entries for all users]" \
            "grantUserEntitlement[Grant an entitlement]" \
            "updateEntitlementItem[Update an entitlement item]" \
            "updateEntitlementTemplate[Update an entitlement template]" \
            "updateUserInventoryBehaviorData[Set the behavior data for an inventory entry]" \
            "updateUserInventoryExpires[Set the expiration date]" \
            "updateUserInventoryStatus[Set the status for an inventory entry]" \
            "useUserEntitlementItem[Use an item]"             "createUserRelationship[Create a user relationship]" \
            "deleteUserRelationship[Delete a user relationship]" \
            "getUserRelationship[Get a user relationship]" \
            "getUserRelationships[Get a list of user relationships]" \
            "updateUserRelationship[Update a user relationship]"             "getUserSubscriptionDetails[Get details about a user's subscription]" \
            "getUsersSubscriptionDetails[Get details about a user's subscriptions]" \
            "reactivateUserSubscription[Reactivate a subscription and charge fee]" \
            "setSubscriptionBillDate[Set a new date to bill a subscription on]" \
            "setSubscriptionPaymentMethod[Set the payment method to use for a subscription]" \
            "setSubscriptionStatus[Set the status of a subscription]" \
            "setUserSubscriptionPlan[Set a new subscription plan for a user]"             "sendBatch[Request to run API call given the method, content type, path url, and body of request]"             "getHealth[Get health info]"             "deleteMaintenance[Delete maintenance info]" \
            "getMaintenance[Get current maintenance info]" \
            "setMaintenance[Set current maintenance info]" \
            "updateMaintenance[Update current maintenance info]"             "getUserLocationLog[Returns the authentication log for a user]" \
            "getUserTokenDetails[Returns the authentication token details. Use /users endpoint for detailed user's info]"             "getVersion[Get current version info]" 
    _arguments "(--help)--help[Print information about operation]"

    ret=0
    ;;
  args)
    case $line[1] in
      getOAuthToken)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createActivity)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createActivityOccurrence)
        local -a _op_arguments
        _op_arguments=(
                    "test=true:[QUERY] if true, indicates that the occurrence should NOT be created. This can be used to test for eligibility and valid settings"
          "test=false:[QUERY] if true, indicates that the occurrence should NOT be created. This can be used to test for eligibility and valid settings"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createActivityTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteActivity)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the activity"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteActivityTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getActivities)
        local -a _op_arguments
        _op_arguments=(
                    "filter_template=true:[QUERY] Filter for activities that are templates, or specifically not if false"
          "filter_template=false:[QUERY] Filter for activities that are templates, or specifically not if false"
"filter_name=:[QUERY] Filter for activities that have a name starting with specified string"
"filter_id=:[QUERY] Filter for activities with an id in the given comma separated list of ids"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getActivity)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the activity"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getActivityTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getActivityTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setActivityOccurrenceResults)
        local -a _op_arguments
        _op_arguments=(
          "activity_occurrence_id=:[PATH] The id of the activity occurrence"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateActivity)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the activity"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateActivityOccurrence)
        local -a _op_arguments
        _op_arguments=(
          "activity_occurrence_id=:[PATH] The id of the activity occurrence"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateActivityTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getSignedS3URL)
        local -a _op_arguments
        _op_arguments=(
                    "filename=:[QUERY] The file name"
"content_type=:[QUERY] The content type"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createClient)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteClient)
        local -a _op_arguments
        _op_arguments=(
          "client_key=:[PATH] The key of the client"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getClient)
        local -a _op_arguments
        _op_arguments=(
          "client_key=:[PATH] The key of the client"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getClientGrantTypes)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getClients)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setClientGrantTypes)
        local -a _op_arguments
        _op_arguments=(
          "client_key=:[PATH] The key of the client"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setClientRedirectUris)
        local -a _op_arguments
        _op_arguments=(
          "client_key=:[PATH] The key of the client"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateClient)
        local -a _op_arguments
        _op_arguments=(
          "client_key=:[PATH] The key of the client"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createPermission)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deletePermission)
        local -a _op_arguments
        _op_arguments=(
          "permission=:[PATH] The permission value"
          "force=true:[QUERY] If true, removes permission assigned to roles"
          "force=false:[QUERY] If true, removes permission assigned to roles"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPermission)
        local -a _op_arguments
        _op_arguments=(
          "permission=:[PATH] The permission value"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPermissions)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updatePermission)
        local -a _op_arguments
        _op_arguments=(
          "permission=:[PATH] The permission value"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createRole)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteRole)
        local -a _op_arguments
        _op_arguments=(
          "role=:[PATH] The role value"
          "force=true:[QUERY] If true, removes role from users/clients"
          "force=false:[QUERY] If true, removes role from users/clients"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getClientRoles)
        local -a _op_arguments
        _op_arguments=(
          "client_key=:[PATH] The client key"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getRole)
        local -a _op_arguments
        _op_arguments=(
          "role=:[PATH] The role value"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getRoles)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserRoles)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The user&#39;s id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setClientRoles)
        local -a _op_arguments
        _op_arguments=(
          "client_key=:[PATH] The client key"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setPermissionsForRole)
        local -a _op_arguments
        _op_arguments=(
          "role=:[PATH] The role value"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setUserRoles)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The user&#39;s id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateRole)
        local -a _op_arguments
        _op_arguments=(
          "role=:[PATH] The role value"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteToken)
        local -a _op_arguments
        _op_arguments=(
          "username=:[PATH] The username of the user"
"client_id=:[PATH] The id of the client"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteTokens)
        local -a _op_arguments
        _op_arguments=(
          "username=:[PATH] The username of the user"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getToken)
        local -a _op_arguments
        _op_arguments=(
          "username=:[PATH] The username of the user"
"client_id=:[PATH] The id of the client"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getTokens)
        local -a _op_arguments
        _op_arguments=(
                    "filter_client_id=:[QUERY] Filters for token whose client id matches provided string"
"filter_username=:[QUERY] Filters for token whose username matches provided string"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBREActions)
        local -a _op_arguments
        _op_arguments=(
                    "filter_category=:[QUERY] Filter for actions that are within a specific category"
"filter_name=:[QUERY] Filter for actions that have names containing the given string"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createBRECategoryTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteBRECategoryTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBRECategories)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBRECategory)
        local -a _op_arguments
        _op_arguments=(
          "name=:[PATH] The category name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBRECategoryTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBRECategoryTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateBRECategory)
        local -a _op_arguments
        _op_arguments=(
          "name=:[PATH] The category name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateBRECategoryTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      sendBREEvent)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBREExpressions)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createBREGlobal)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteBREGlobal)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the global definition"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBREGlobal)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the global definition"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBREGlobals)
        local -a _op_arguments
        _op_arguments=(
                    "filter_system=true:[QUERY] Filter for globals that are system globals when true, or not when false. Leave off for both mixed"
          "filter_system=false:[QUERY] Filter for globals that are system globals when true, or not when false. Leave off for both mixed"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateBREGlobal)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the global definition"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createBRERule)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteBRERule)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the rule"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBREExpressionAsString)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBRERule)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the rule"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBRERules)
        local -a _op_arguments
        _op_arguments=(
                    "filter_name=:[QUERY] Filter for rules containing the given name"
"filter_enabled=true:[QUERY] Filter for rules by active status, null for both"
          "filter_enabled=false:[QUERY] Filter for rules by active status, null for both"
"filter_system=true:[QUERY] Filter for rules that are system rules when true, or not when false. Leave off for both mixed"
          "filter_system=false:[QUERY] Filter for rules that are system rules when true, or not when false. Leave off for both mixed"
"filter_trigger=:[QUERY] Filter for rules that are for the trigger with the given name"
"filter_action=:[QUERY] Filter for rules that use the action with the given name"
"filter_condition=:[QUERY] Filter for rules that have a condition containing the given string"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setBRERule)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the rule"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateBRERule)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the rule"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createBRETrigger)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteBRETrigger)
        local -a _op_arguments
        _op_arguments=(
          "event_name=:[PATH] The trigger event name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBRETrigger)
        local -a _op_arguments
        _op_arguments=(
          "event_name=:[PATH] The trigger event name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBRETriggers)
        local -a _op_arguments
        _op_arguments=(
                    "filter_system=true:[QUERY] Filter for triggers that are system triggers when true, or not when false. Leave off for both mixed"
          "filter_system=false:[QUERY] Filter for triggers that are system triggers when true, or not when false. Leave off for both mixed"
"filter_category=:[QUERY] Filter for triggers that are within a specific category"
"filter_name=:[QUERY] Filter for triggers that have names containing the given string"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateBRETrigger)
        local -a _op_arguments
        _op_arguments=(
          "event_name=:[PATH] The trigger event name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBREVariableTypes)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addChallengeToCampaign)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the campaign"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCampaign)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCampaignTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCampaign)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The campaign id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCampaignTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCampaign)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The campaign id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCampaignChallenges)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The campaign id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCampaignTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCampaignTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCampaigns)
        local -a _op_arguments
        _op_arguments=(
                    "filter_active=true:[QUERY] Filter for campaigns that are active"
          "filter_active=false:[QUERY] Filter for campaigns that are active"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removeChallengeFromCampaign)
        local -a _op_arguments
        _op_arguments=(
          "campaign_id=:[PATH] The campaign id"
"id=:[PATH] The challenge id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCampaign)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The campaign id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCampaignTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createChallenge)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createChallengeActivity)
        local -a _op_arguments
        _op_arguments=(
          "challenge_id=:[PATH] The challenge id"
          "validateSettings=true:[QUERY] Whether to validate the settings being sent against the available settings on the base activity."
          "validateSettings=false:[QUERY] Whether to validate the settings being sent against the available settings on the base activity."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createChallengeActivityTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createChallengeTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteChallenge)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The challenge id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteChallengeActivity)
        local -a _op_arguments
        _op_arguments=(
          "activity_id=:[PATH] The activity id"
"challenge_id=:[PATH] The challenge id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteChallengeActivityTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteChallengeEvent)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The challenge event id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteChallengeTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getChallenge)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The challenge id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getChallengeActivities)
        local -a _op_arguments
        _op_arguments=(
          "challenge_id=:[PATH] The challenge id"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getChallengeActivity)
        local -a _op_arguments
        _op_arguments=(
          "activity_id=:[PATH] The activity id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getChallengeActivityTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getChallengeActivityTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getChallengeEvent)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The challenge event id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getChallengeEvents)
        local -a _op_arguments
        _op_arguments=(
                    "filter_start_date=:[QUERY] A comma separated string without spaces.  First value is the operator to search on, second value is the event start date, a unix timestamp in seconds.  Allowed operators: (GT, LT, EQ, GOE, LOE)."
"filter_end_date=:[QUERY] A comma separated string without spaces.  First value is the operator to search on, second value is the event end date, a unix timestamp in seconds.  Allowed operators: (GT, LT, EQ, GOE, LOE)."
"filter_campaigns=true:[QUERY] check only for events from currently running campaigns"
          "filter_campaigns=false:[QUERY] check only for events from currently running campaigns"
"filter_challenge=:[QUERY] check only for events from the challenge specified by id"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getChallengeTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getChallengeTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getChallenges)
        local -a _op_arguments
        _op_arguments=(
                    "filter_template=true:[QUERY] Filter for challenges that are not tied to campaigns (templates)"
          "filter_template=false:[QUERY] Filter for challenges that are not tied to campaigns (templates)"
"filter_active_campaign=true:[QUERY] Filter for challenges that are tied to active campaigns"
          "filter_active_campaign=false:[QUERY] Filter for challenges that are tied to active campaigns"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateChallenge)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The challenge id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateChallengeActivity)
        local -a _op_arguments
        _op_arguments=(
          "activity_id=:[PATH] The activity id"
"challenge_id=:[PATH] The challenge id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateChallengeActivityTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateChallengeTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createRewardSet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteRewardSet)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The reward id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getRewardSet)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The reward id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getRewardSets)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateRewardSet)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The reward id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCategory)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCategoryTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCategory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the category to be deleted"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCategoryTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCategories)
        local -a _op_arguments
        _op_arguments=(
                    "filter_search=:[QUERY] Filter for categories whose names begin with provided string"
"filter_active=true:[QUERY] Filter for categories that are specifically active or inactive"
          "filter_active=false:[QUERY] Filter for categories that are specifically active or inactive"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCategory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the category to retrieve"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCategoryTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCategoryTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getTags)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCategory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the category"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCategoryTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createConfig)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteConfig)
        local -a _op_arguments
        _op_arguments=(
          "name=:[PATH] The config name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getConfig)
        local -a _op_arguments
        _op_arguments=(
          "name=:[PATH] The config name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getConfigs)
        local -a _op_arguments
        _op_arguments=(
                    "filter_search=:[QUERY] Filter for configs whose name contains the given string"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateConfig)
        local -a _op_arguments
        _op_arguments=(
          "name=:[PATH] The config name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createArticle)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createArticleTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteArticle)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The article id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteArticleTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getArticle)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The article id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getArticleTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getArticleTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getArticles)
        local -a _op_arguments
        _op_arguments=(
                    "filter_category=:[QUERY] Filter for articles from a specific category by id"
"filter_tagset=:[QUERY] Filter for articles with specified tags (separated by comma)"
"filter_title=:[QUERY] Filter for articles whose title contains a string"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateArticle)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The article id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateArticleTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addComment)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteComment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The comment id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getComment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The comment id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getComments)
        local -a _op_arguments
        _op_arguments=(
                    "context=:[QUERY] Get comments by context type"
"context_id=:[QUERY] Get comments by context id"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      searchComments)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateComment)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The comment id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      answerPoll)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The poll id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createPoll)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createPollTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deletePoll)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The poll id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deletePollTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPoll)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The poll id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPollAnswer)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The poll id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPollTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPollTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPolls)
        local -a _op_arguments
        _op_arguments=(
                    "filter_category=:[QUERY] Filter for polls from a specific category by id"
"filter_tagset=:[QUERY] Filter for polls with specified tags (separated by comma)"
"filter_text=:[QUERY] Filter for polls whose text contains a string"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updatePoll)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The poll id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updatePollTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCurrency)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCurrency)
        local -a _op_arguments
        _op_arguments=(
          "code=:[PATH] The currency code"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCurrencies)
        local -a _op_arguments
        _op_arguments=(
                    "filter_enabled_currencies=true:[QUERY] Filter for alternate currencies setup explicitely in system config"
          "filter_enabled_currencies=false:[QUERY] Filter for alternate currencies setup explicitely in system config"
"filter_type=:[QUERY] Filter currencies by type.  Allowable values: (&#39;virtual&#39;, &#39;real&#39;)"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCurrency)
        local -a _op_arguments
        _op_arguments=(
          "code=:[PATH] The currency code"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCurrency)
        local -a _op_arguments
        _op_arguments=(
          "code=:[PATH] The currency code"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createDevice)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteDevice)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getDevice)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getDevices)
        local -a _op_arguments
        _op_arguments=(
                    "filter_make=:[QUERY] Filter for devices with specified make"
"filter_model=:[QUERY] Filter for devices with specified model"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateDevice)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addDisposition)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteDisposition)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the disposition record"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getDisposition)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the disposition record"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getDispositionCounts)
        local -a _op_arguments
        _op_arguments=(
                    "filter_context=:[QUERY] Filter for dispositions within a context type (games, articles, polls, etc). Optionally with a specific id like filter_context&#x3D;video:47"
"filter_owner=:[QUERY] Filter for dispositions from a specific user by id or &#39;me&#39;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getDispositions)
        local -a _op_arguments
        _op_arguments=(
                    "filter_context=:[QUERY] Filter for dispositions within a context type (games, articles, polls, etc). Optionally with a specific id like filter_context&#x3D;video:47"
"filter_owner=:[QUERY] Filter for dispositions from a specific user by id or &#39;me&#39;"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createFulfillmentType)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteFulfillmentType)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFulfillmentType)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFulfillmentTypes)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateFulfillmentType)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createAchievement)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createAchievementTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteAchievement)
        local -a _op_arguments
        _op_arguments=(
          "name=:[PATH] The name of the achievement"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteAchievementTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAchievement)
        local -a _op_arguments
        _op_arguments=(
          "name=:[PATH] The name of the achievement"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAchievementTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAchievementTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAchievementTriggers)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAchievements)
        local -a _op_arguments
        _op_arguments=(
                    "filter_tagset=:[QUERY] Filter for achievements with specified tags (separated by comma)"
"filter_name=:[QUERY] Filter for achievements whose name contains a string"
"filter_hidden=true:[QUERY] Filter for achievements that are hidden or not"
          "filter_hidden=false:[QUERY] Filter for achievements that are hidden or not"
"filter_derived=true:[QUERY] Filter for achievements that are derived from other services"
          "filter_derived=false:[QUERY] Filter for achievements that are derived from other services"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getDerivedAchievements)
        local -a _op_arguments
        _op_arguments=(
          "name=:[PATH] The name of the derived achievement"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserAchievementProgress)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The user&#39;s id"
"achievement_name=:[PATH] The achievement&#39;s name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserAchievementsProgress)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The user&#39;s id"
          "filter_achievement_derived=true:[QUERY] Filter for achievements that are derived from other services"
          "filter_achievement_derived=false:[QUERY] Filter for achievements that are derived from other services"
"filter_achievement_tagset=:[QUERY] Filter for achievements with specified tags (separated by comma)"
"filter_achievement_name=:[QUERY] Filter for achievements whose name contains a string"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUsersAchievementProgress)
        local -a _op_arguments
        _op_arguments=(
          "achievement_name=:[PATH] The achievement&#39;s name"
          "filter_achievement_derived=true:[QUERY] Filter for achievements that are derived from other services"
          "filter_achievement_derived=false:[QUERY] Filter for achievements that are derived from other services"
"filter_achievement_tagset=:[QUERY] Filter for achievements with specified tags (separated by comma)"
"filter_achievement_name=:[QUERY] Filter for achievements whose name contains a string"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUsersAchievementsProgress)
        local -a _op_arguments
        _op_arguments=(
                    "filter_achievement_derived=true:[QUERY] Filter for achievements that are derived from other services"
          "filter_achievement_derived=false:[QUERY] Filter for achievements that are derived from other services"
"filter_achievement_tagset=:[QUERY] Filter for achievements with specified tags (separated by comma)"
"filter_achievement_name=:[QUERY] Filter for achievements whose name contains a string"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      incrementAchievementProgress)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The user&#39;s id"
"achievement_name=:[PATH] The achievement&#39;s name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setAchievementProgress)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The user&#39;s id"
"achievement_name=:[PATH] The achievement&#39;s name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateAchievement)
        local -a _op_arguments
        _op_arguments=(
          "name=:[PATH] The name of the achievement"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateAchievementTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getLeaderboard)
        local -a _op_arguments
        _op_arguments=(
          "context_type=:[PATH] The context type for the leaderboard"
"context_id=:[PATH] The context id for the leaderboard"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getLeaderboardRank)
        local -a _op_arguments
        _op_arguments=(
          "context_type=:[PATH] The context type for the leaderboard"
"context_id=:[PATH] The context id for the leaderboard"
"id=:[PATH] The id of a user"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getLeaderboardStrategies)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createLevel)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteLevel)
        local -a _op_arguments
        _op_arguments=(
          "name=:[PATH] The level schema name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getLevel)
        local -a _op_arguments
        _op_arguments=(
          "name=:[PATH] The level schema name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getLevelTriggers)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getLevels)
        local -a _op_arguments
        _op_arguments=(
                    "filter_name=:[QUERY] Filter for level schemas whose name contains a given string"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserLevel)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"name=:[PATH] The level schema name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserLevels)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      incrementProgress)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"name=:[PATH] The level schema name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setProgress)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"name=:[PATH] The level schema name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateLevel)
        local -a _op_arguments
        _op_arguments=(
          "name=:[PATH] The level schema name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addMetric)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addQuestionAnswers)
        local -a _op_arguments
        _op_arguments=(
          "question_id=:[PATH] The id of the question"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addQuestionTag)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the question"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addTagToQuestionsBatch)
        local -a _op_arguments
        _op_arguments=(
                    "filter_search=:[QUERY] Filter for documents whose question, answers or tags contains provided string"
"filter_idset=:[QUERY] Filter for documents whose id is in the comma separated list provided"
"filter_category=:[QUERY] Filter for questions with specified category, by id"
"filter_tag=:[QUERY] Filter for questions with specified tag"
"filter_tagset=:[QUERY] Filter for questions with specified tags (separated by comma)"
"filter_type=:[QUERY] Filter for questions with specified type"
"filter_published=true:[QUERY] Filter for questions currenctly published or not"
          "filter_published=false:[QUERY] Filter for questions currenctly published or not"
"filter_import_id=:[QUERY] Filter for questions from a specific import job"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createImportJob)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createQuestion)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createQuestionTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteImportJob)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the job"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteQuestion)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the question"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteQuestionAnswers)
        local -a _op_arguments
        _op_arguments=(
          "question_id=:[PATH] The id of the question"
"id=:[PATH] The id of the answer"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteQuestionTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getImportJob)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the job"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getImportJobs)
        local -a _op_arguments
        _op_arguments=(
                    "filter_vendor=:[QUERY] Filter for jobs by vendor id"
"filter_category=:[QUERY] Filter for jobs by category id"
"filter_name=:[QUERY] Filter for jobs which name *STARTS* with the given string"
"filter_status=:[QUERY] Filter for jobs that are in a specific set of statuses (comma separated)"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getQuestion)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the question"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getQuestionAnswer)
        local -a _op_arguments
        _op_arguments=(
          "question_id=:[PATH] The id of the question"
"id=:[PATH] The id of the answer"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getQuestionAnswers)
        local -a _op_arguments
        _op_arguments=(
          "question_id=:[PATH] The id of the question"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getQuestionDeltas)
        local -a _op_arguments
        _op_arguments=(
                    "since=:[QUERY] Timestamp in seconds"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getQuestionTags)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the question"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getQuestionTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getQuestionTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getQuestions)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
"filter_search=:[QUERY] Filter for documents whose question, answers or tags contains provided string"
"filter_idset=:[QUERY] Filter for documents whose id is in the comma separated list provided"
"filter_category=:[QUERY] Filter for questions with specified category, by id"
"filter_tagset=:[QUERY] Filter for questions with specified tags (separated by comma)"
"filter_tag=:[QUERY] Filter for questions with specified tag"
"filter_type=:[QUERY] Filter for questions with specified type.  Allowable values: (&#39;TEXT&#39;, &#39;IMAGE&#39;, &#39;VIDEO&#39;, &#39;AUDIO&#39;)"
"filter_published=true:[QUERY] Filter for questions currenctly published or not"
          "filter_published=false:[QUERY] Filter for questions currenctly published or not"
"filter_import_id=:[QUERY] Filter for questions from a specific import job"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getQuestionsCount)
        local -a _op_arguments
        _op_arguments=(
                    "filter_search=:[QUERY] Filter for documents whose question, answers or tags contains provided string"
"filter_idset=:[QUERY] Filter for documents whose id is in the comma separated list provided"
"filter_category=:[QUERY] Filter for questions with specified category, by id"
"filter_tag=:[QUERY] Filter for questions with specified tag"
"filter_tagset=:[QUERY] Filter for questions with specified tags (separated by comma)"
"filter_type=:[QUERY] Filter for questions with specified type.  Allowable values: (&#39;TEXT&#39;, &#39;IMAGE&#39;, &#39;VIDEO&#39;, &#39;AUDIO&#39;)"
"filter_published=true:[QUERY] Filter for questions currenctly published or not"
          "filter_published=false:[QUERY] Filter for questions currenctly published or not"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      processImportJob)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the job"
          "publish_now=true:[QUERY] Whether the new questions should be published live immediately"
          "publish_now=false:[QUERY] Whether the new questions should be published live immediately"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removeQuestionTag)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the question"
"tag=:[PATH] The tag to remove"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removeTagToQuestionsBatch)
        local -a _op_arguments
        _op_arguments=(
          "tag=:[PATH] The tag to remove"
          "filter_search=:[QUERY] Filter for documents whose question, answers or tags contains provided string"
"filter_idset=:[QUERY] Filter for documents whose id is in the comma separated list provided"
"filter_category=:[QUERY] Filter for questions with specified category, by id"
"filter_tag=:[QUERY] Filter for questions with specified tag"
"filter_tagset=:[QUERY] Filter for questions with specified tags (separated by comma)"
"filter_type=:[QUERY] Filter for questions with specified type.  Allowable values: (&#39;TEXT&#39;, &#39;IMAGE&#39;, &#39;VIDEO&#39;, &#39;AUDIO&#39;)"
"filter_published=true:[QUERY] Filter for questions currenctly published or not"
          "filter_published=false:[QUERY] Filter for questions currenctly published or not"
"filter_import_id=:[QUERY] Filter for questions from a specific import job"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      searchQuestionTags)
        local -a _op_arguments
        _op_arguments=(
                    "filter_search=:[QUERY] Filter for tags starting with the given text"
"filter_category=:[QUERY] Filter for tags on questions from a specific category"
"filter_import_id=:[QUERY] Filter for tags on questions from a specific import job"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateImportJob)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the job"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateQuestion)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the question"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateQuestionAnswer)
        local -a _op_arguments
        _op_arguments=(
          "question_id=:[PATH] The id of the question"
"id=:[PATH] The id of the answer"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateQuestionTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateQuestionsInBulk)
        local -a _op_arguments
        _op_arguments=(
                    "filter_search=:[QUERY] Filter for documents whose question, answers or tags contains provided string"
"filter_idset=:[QUERY] Filter for documents whose id is in the comma separated list provided"
"filter_category=:[QUERY] Filter for questions with specified category, by id"
"filter_tagset=:[QUERY] Filter for questions with specified tags (separated by comma)"
"filter_type=:[QUERY] Filter for questions with specified type.  Allowable values: (&#39;TEXT&#39;, &#39;IMAGE&#39;, &#39;VIDEO&#39;, &#39;AUDIO&#39;)"
"filter_published=true:[QUERY] Filter for questions currenctly published or not"
          "filter_published=false:[QUERY] Filter for questions currenctly published or not"
"filter_import_id=:[QUERY] Filter for questions from a specific import job"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createInvoice)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFulFillmentStatuses)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getInvoice)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the invoice"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getInvoiceLogs)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the invoice"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getInvoices)
        local -a _op_arguments
        _op_arguments=(
                    "filter_user=:[QUERY] The id of a user to get invoices for. Automtically added if not being called with admin permissions."
"filter_email=:[QUERY] Filters invoices by customer&#39;s email. Admins only."
"filter_fulfillment_status=:[QUERY] Filters invoices by fulfillment status type. Can be a comma separated list of statuses"
"filter_payment_status=:[QUERY] Filters invoices by payment status type. Can be a comma separated list of statuses"
"filter_item_name=:[QUERY] Filters invoices by item name containing the given string"
"filter_external_ref=:[QUERY] Filters invoices by external reference."
"filter_created_date=:[QUERY] Filters invoices by creation date. Multiple values possible for range search. Format: filter_created_date&#x3D;OP,ts&amp;... where OP in (GT, LT, GOE, LOE, EQ) and ts is a unix timestamp in seconds. Ex: filter_created_date&#x3D;GT,1452154258,LT,1554254874"
"filter_vendor_ids=:[QUERY] Filters invoices for ones from one of the vendors whose id is in the given comma separated list"
"filter_currency=:[QUERY] Filters invoices by currency. ISO3 currency code"
"filter_shipping_state_name=:[QUERY] Filters invoices by shipping address: Exact match state name"
"filter_shipping_country_name=:[QUERY] Filters invoices by shipping address: Exact match country name"
"filter_shipping=:[QUERY] Filters invoices by shipping price. Multiple values possible for range search. Format: filter_shipping&#x3D;OP,ts&amp;... where OP in (GT, LT, GOE, LOE, EQ). Ex: filter_shipping&#x3D;GT,14.58,LT,15.54"
"filter_vendor_name=:[QUERY] Filters invoices by vendor name starting with given string"
"filter_sku=:[QUERY] Filters invoices by item sku"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPaymentStatuses)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      payInvoice)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the invoice"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setExternalRef)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the invoice"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setInvoiceItemFulfillmentStatus)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the invoice"
"sku=:[PATH] The sku of an item in the invoice"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setOrderNotes)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the invoice"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setPaymentStatus)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the invoice"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateBillingInfo)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the invoice"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCountries)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCountryByGeoLocation)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCountryStates)
        local -a _op_arguments
        _op_arguments=(
          "country_code_iso3=:[PATH] The iso3 code of the country"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCurrencyByGeoLocation)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addUserLog)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBREEventLog)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The BRE event log entry id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBREEventLogs)
        local -a _op_arguments
        _op_arguments=(
                    "filter_start_date=:[QUERY] A comma separated string without spaces.  First value is the operator to search on, second value is the event log start date, a unix timestamp in seconds.  Allowed operators: (GT, LT, EQ, GOE, LOE)."
"filter_event_name=:[QUERY] Filter event logs by event name"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBREForwardLog)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The forward log entry id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBREForwardLogs)
        local -a _op_arguments
        _op_arguments=(
                    "filter_start_date=:[QUERY] A comma separated string without spaces.  First value is the operator to search on, second value is the log start date, a unix timestamp in seconds.  Allowed operators: (GT, LT, EQ, GOE, LOE)."
"filter_end_date=:[QUERY] A comma separated string without spaces.  First value is the operator to search on, second value is the log end date, a unix timestamp in seconds.  Allowed operators: (GT, LT, EQ, GOE, LOE)."
"filter_status_code=:[QUERY] Filter forward logs by http status code"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserLog)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The user log entry id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserLogs)
        local -a _op_arguments
        _op_arguments=(
                    "filter_user=:[QUERY] Filter for actions taken by a specific user by id"
"filter_action_name=:[QUERY] Filter for actions of a specific name"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addArtist)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createArtistTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteArtist)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The artist id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteArtistTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getArtist)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The artist id"
          "show_contributions=:[QUERY] The number of contributions to show fetch"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getArtistTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getArtistTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getArtists)
        local -a _op_arguments
        _op_arguments=(
                    "filter_artists_by_name=:[QUERY] Filter for artists which name *STARTS* with the given string"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateArtist)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The artist id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateArtistTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getModerationReport)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The flag report id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getModerationReports)
        local -a _op_arguments
        _op_arguments=(
                    "exclude_resolved=true:[QUERY] Ignore resolved context"
          "exclude_resolved=false:[QUERY] Ignore resolved context"
"filter_context=:[QUERY] Filter by moderation context"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateModerationReport)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The flag report id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addUserToVideoWhitelist)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The video id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addVideo)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addVideoComment)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addVideoContributor)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addVideoFlag)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addVideoRelationships)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createVideoDisposition)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteVideo)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The video id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteVideoComment)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
"id=:[PATH] The comment id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteVideoDisposition)
        local -a _op_arguments
        _op_arguments=(
          "disposition_id=:[PATH] The disposition id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteVideoFlag)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteVideoRelationship)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
"id=:[PATH] The relationship id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserVideos)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The user id"
          "exclude_flagged=true:[QUERY] Skip videos that have been flagged by the current user"
          "exclude_flagged=false:[QUERY] Skip videos that have been flagged by the current user"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getVideo)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The video id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getVideoComments)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getVideoDispositions)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getVideoRelationships)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getVideos)
        local -a _op_arguments
        _op_arguments=(
                    "exclude_flagged=true:[QUERY] Skip videos that have been flagged by the current user"
          "exclude_flagged=false:[QUERY] Skip videos that have been flagged by the current user"
"filter_videos_by_uploader=:[QUERY] Filter for videos by uploader id"
"filter_category=:[QUERY] Filter for videos from a specific category by id"
"filter_tagset=:[QUERY] Filter for videos with specified tags (separated by comma)"
"filter_videos_by_name=:[QUERY] Filter for videos which name *STARTS* with the given string"
"filter_videos_by_contributor=:[QUERY] Filter for videos with contribution from the artist specified by ID"
"filter_videos_by_author=:[QUERY] Filter for videos with an artist as author specified by ID"
"filter_has_author=true:[QUERY] Filter for videos that have an author set if true, or that have no author if false"
          "filter_has_author=false:[QUERY] Filter for videos that have an author set if true, or that have no author if false"
"filter_has_uploader=true:[QUERY] Filter for videos that have an uploader set if true, or that have no uploader if false"
          "filter_has_uploader=false:[QUERY] Filter for videos that have an uploader set if true, or that have no uploader if false"
"filter_related_to=:[QUERY] Filter for videos that have designated a particular video as the TO of a relationship. Pattern should match VIDEO_ID or VIDEO_ID:DETAILS to match with a specific details string as well"
"filter_friends=true:[QUERY] Filter for videos uploaded by friends. &#39;true&#39; for friends of the caller (requires user token) or a user id for a specific user&#39;s friends (requires VIDEOS_ADMIN permission)"
          "filter_friends=false:[QUERY] Filter for videos uploaded by friends. &#39;true&#39; for friends of the caller (requires user token) or a user id for a specific user&#39;s friends (requires VIDEOS_ADMIN permission)"
"filter_disposition=:[QUERY] Filter for videos a given user has a given disposition towards. USER_ID:DISPOSITION where USER_ID is the id of the user who has this disposition or &#39;me&#39; for the caller (requires user token for &#39;me&#39;) and DISPOSITION is the name of the disposition. E.G. filter_disposition&#x3D;123:like or filter_disposition&#x3D;me:favorite"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removeUserFromVideoWhitelist)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
"id=:[PATH] The user id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removeVideoContributor)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
"id=:[PATH] The contributor id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateVideo)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The video id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateVideoComment)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
"id=:[PATH] The comment id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateVideoRelationship)
        local -a _op_arguments
        _op_arguments=(
          "video_id=:[PATH] The video id"
"relationship_id=:[PATH] The relationship id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      viewVideo)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The video id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      sendRawEmail)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      sendRawSMS)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      sendTemplatedEmail)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      sendTemplatedSMS)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createPaymentMethod)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] ID of the user for whom the payment method is being created"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deletePaymentMethod)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] ID of the user for whom the payment method is being updated"
"id=:[PATH] ID of the payment method being deleted"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPaymentMethod)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] ID of the user for whom the payment method is being retrieved"
"id=:[PATH] ID of the payment method being retrieved"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPaymentMethods)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] ID of the user for whom the payment methods are being retrieved"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] a comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      paymentAuthorization)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      paymentCapture)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the payment authorization to capture"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updatePaymentMethod)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] ID of the user for whom the payment method is being updated"
"id=:[PATH] ID of the payment method being updated"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      verifyAppleReceipt)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      handleGooglePayment)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      silentPostOptimal)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createPayPalBillingAgreementUrl)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createPayPalExpressCheckout)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      finalizePayPalBillingAgreement)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      finalizePayPalCheckout)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createStripePaymentMethod)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      payStripeInvoice)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getTransaction)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getTransactions)
        local -a _op_arguments
        _op_arguments=(
                    "filter_invoice=:[QUERY] Filter for transactions from a specific invoice"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      refundTransaction)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the transaction to refund"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserWallet)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The ID of the user for whom wallet is being retrieved"
"currency_code=:[PATH] Currency code of the user&#39;s wallet"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserWalletTransactions)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The ID of the user for whom wallet transactions are being retrieved"
"currency_code=:[PATH] Currency code of the user&#39;s wallet"
          "filter_type=:[QUERY] Filter for transactions with specified type"
"filter_max_date=:[QUERY] Filter for transactions from no earlier than the specified date as a unix timestamp in seconds"
"filter_min_date=:[QUERY] Filter for transactions from no later than the specified date as a unix timestamp in seconds"
"filter_sign=:[QUERY] Filter for transactions with amount with the given sign.  Allowable values: (&#39;positive&#39;, &#39;negative&#39;)"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserWallets)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The ID of the user for whom wallets are being retrieved"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getWalletBalances)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getWalletTransactions)
        local -a _op_arguments
        _op_arguments=(
                    "filter_invoice=:[QUERY] Filter for transactions from a specific invoice"
"filter_type=:[QUERY] Filter for transactions with specified type"
"filter_date=:[QUERY] A comma separated string without spaces.  First value is the operator to search on, second value is the log start date, a unix timestamp in seconds. Can be repeated for a range, eg: GT,123,LT,456  Allowed operators: (GT, LT, EQ, GOE, LOE)."
"filter_sign=:[QUERY] Filter for transactions with amount with the given sign"
"filter_user_id=:[QUERY] Filter for transactions for specific userId"
"filter_username=:[QUERY] Filter for transactions for specific username that start with the given string"
"filter_details=:[QUERY] Filter for transactions for specific details that start with the given string"
"filter_currency_code=:[QUERY] Filter for transactions for specific currency code"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getWallets)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateWalletBalance)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The ID of the user for whom wallet is being modified"
"currency_code=:[PATH] Currency code of the user&#39;s wallet"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createXsollaTokenUrl)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      receiveXsollaNotification)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getChallengeEventLeaderboard)
        local -a _op_arguments
        _op_arguments=(
                    "filter_event=:[QUERY] A sepecific challenge event id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getChallengeEventParticipants)
        local -a _op_arguments
        _op_arguments=(
                    "filter_event=:[QUERY] A sepecific challenge event id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getInvoiceReports)
        local -a _op_arguments
        _op_arguments=(
          "currency_code=:[PATH] The code for a currency to get sales data for"
          "granularity=:[QUERY] The time duration to aggregate by"
"filter_payment_status=:[QUERY] A payment status to filter results by, can be a comma separated list"
"filter_fulfillment_status=:[QUERY] An invoice fulfillment status to filter results by, can be a comma separated list"
"start_date=:[QUERY] The start of the time range to return, unix timestamp in seconds. Default is beginning of time"
"end_date=:[QUERY] The end of the time range to return, unix timestamp in seconds. Default is end of time"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getItemRevenue)
        local -a _op_arguments
        _op_arguments=(
          "currency_code=:[PATH] The code for a currency to get sales data for"
          "start_date=:[QUERY] The start of the time range to aggregate, unix timestamp in seconds. Default is beginning of time"
"end_date=:[QUERY] The end of the time range to aggregate, unix timestamp in seconds. Default is end of time"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getRefundRevenue)
        local -a _op_arguments
        _op_arguments=(
          "currency_code=:[PATH] The code for a currency to get refund data for"
          "start_date=:[QUERY] The start of the time range to aggregate, unix timestamp in seconds. Default is beginning of time"
"end_date=:[QUERY] The end of the time range to aggregate, unix timestamp in seconds. Default is end of time"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getRevenueByCountry)
        local -a _op_arguments
        _op_arguments=(
          "currency_code=:[PATH] The code for a currency to get sales data for"
          "start_date=:[QUERY] The start of the time range to aggregate, unix timestamp in seconds. Default is beginning of time"
"end_date=:[QUERY] The end of the time range to aggregate, unix timestamp in seconds. Default is end of time"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getRevenueByItem)
        local -a _op_arguments
        _op_arguments=(
          "currency_code=:[PATH] The code for a currency to get sales data for"
          "start_date=:[QUERY] The start of the time range to aggregate, unix timestamp in seconds. Default is beginning of time"
"end_date=:[QUERY] The end of the time range to aggregate, unix timestamp in seconds. Default is end of time"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getSubscriptionRevenue)
        local -a _op_arguments
        _op_arguments=(
          "currency_code=:[PATH] The code for a currency to get sales data for"
          "start_date=:[QUERY] The start of the time range to aggregate, unix timestamp in seconds. Default is beginning of time"
"end_date=:[QUERY] The end of the time range to aggregate, unix timestamp in seconds. Default is end of time"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getSubscriptionReports)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUsageByDay)
        local -a _op_arguments
        _op_arguments=(
                    "start_date=:[QUERY] The beginning of the range being requested, unix timestamp in seconds"
"end_date=:[QUERY] The ending of the range being requested, unix timestamp in seconds"
"combine_endpoints=true:[QUERY] Whether to combine counts from different endpoint. Removes the url and method from the result object"
          "combine_endpoints=false:[QUERY] Whether to combine counts from different endpoint. Removes the url and method from the result object"
"method=:[QUERY] Filter for a certain endpoint method.  Must include url as well to work"
"url=:[QUERY] Filter for a certain endpoint.  Must include method as well to work"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUsageByHour)
        local -a _op_arguments
        _op_arguments=(
                    "start_date=:[QUERY] The beginning of the range being requested, unix timestamp in seconds"
"end_date=:[QUERY] The ending of the range being requested, unix timestamp in seconds"
"combine_endpoints=true:[QUERY] Whether to combine counts from different endpoint. Removes the url and method from the result object"
          "combine_endpoints=false:[QUERY] Whether to combine counts from different endpoint. Removes the url and method from the result object"
"method=:[QUERY] Filter for a certain endpoint method.  Must include url as well to work"
"url=:[QUERY] Filter for a certain endpoint.  Must include method as well to work"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUsageByMinute)
        local -a _op_arguments
        _op_arguments=(
                    "start_date=:[QUERY] The beginning of the range being requested, unix timestamp in seconds"
"end_date=:[QUERY] The ending of the range being requested, unix timestamp in seconds"
"combine_endpoints=true:[QUERY] Whether to combine counts from different endpoint. Removes the url and method from the result object"
          "combine_endpoints=false:[QUERY] Whether to combine counts from different endpoint. Removes the url and method from the result object"
"method=:[QUERY] Filter for a certain endpoint method.  Must include url as well to work"
"url=:[QUERY] Filter for a certain endpoint.  Must include method as well to work"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUsageByMonth)
        local -a _op_arguments
        _op_arguments=(
                    "start_date=:[QUERY] The beginning of the range being requested, unix timestamp in seconds"
"end_date=:[QUERY] The ending of the range being requested, unix timestamp in seconds"
"combine_endpoints=true:[QUERY] Whether to combine counts from different endpoint. Removes the url and method from the result object"
          "combine_endpoints=false:[QUERY] Whether to combine counts from different endpoint. Removes the url and method from the result object"
"method=:[QUERY] Filter for a certain endpoint method.  Must include url as well to work"
"url=:[QUERY] Filter for a certain endpoint.  Must include method as well to work"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUsageByYear)
        local -a _op_arguments
        _op_arguments=(
                    "start_date=:[QUERY] The beginning of the range being requested, unix timestamp in seconds"
"end_date=:[QUERY] The ending of the range being requested, unix timestamp in seconds"
"combine_endpoints=true:[QUERY] Whether to combine counts from different endpoints. Removes the url and method from the result object"
          "combine_endpoints=false:[QUERY] Whether to combine counts from different endpoints. Removes the url and method from the result object"
"method=:[QUERY] Filter for a certain endpoint method.  Must include url as well to work"
"url=:[QUERY] Filter for a certain endpoint.  Must include method as well to work"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUsageEndpoints)
        local -a _op_arguments
        _op_arguments=(
                    "start_date=:[QUERY] The beginning of the range being requested, unix timestamp in seconds"
"end_date=:[QUERY] The ending of the range being requested, unix timestamp in seconds"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserRegistrations)
        local -a _op_arguments
        _op_arguments=(
                    "granularity=:[QUERY] The time duration to aggregate by"
"start_date=:[QUERY] The start of the time range to aggregate, unix timestamp in seconds. Default is beginning of time"
"end_date=:[QUERY] The end of the time range to aggregate, unix timestamp in seconds. Default is end of time"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addSearchIndex)
        local -a _op_arguments
        _op_arguments=(
          "type=:[PATH] The index type"
"id=:[PATH] The ID of the object"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addSearchMappings)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSearchIndex)
        local -a _op_arguments
        _op_arguments=(
          "type=:[PATH] The index type"
"id=:[PATH] The ID of the object to delete"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSearchIndexes)
        local -a _op_arguments
        _op_arguments=(
          "type=:[PATH] The index type"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      searchIndex)
        local -a _op_arguments
        _op_arguments=(
          "type=:[PATH] The index type"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      linkAccounts)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      linkAccounts1)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createItemTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createStoreItem)
        local -a _op_arguments
        _op_arguments=(
                    "cascade=true:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          "cascade=false:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteItemTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] force deleting the template if it&#39;s attached to other objects, cascade &#x3D; detach"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteStoreItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the item"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBehaviors)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getItemTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getItemTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getStore)
        local -a _op_arguments
        _op_arguments=(
                    "limit=:[QUERY] The amount of items returned"
"page=:[QUERY] The page of the request"
"use_catalog=true:[QUERY] Whether to remove items that are not intended for display or not in date"
          "use_catalog=false:[QUERY] Whether to remove items that are not intended for display or not in date"
"ignore_location=true:[QUERY] Whether to ignore country restrictions based on the caller&#39;s location"
          "ignore_location=false:[QUERY] Whether to ignore country restrictions based on the caller&#39;s location"
"in_stock_only=true:[QUERY] Whether only in-stock items should be returned.  Default value is false"
          "in_stock_only=false:[QUERY] Whether only in-stock items should be returned.  Default value is false"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getStoreItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the item"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getStoreItems)
        local -a _op_arguments
        _op_arguments=(
                    "filter_name_search=:[QUERY] Filter for items whose name starts with a given string."
"filter_unique_key=:[QUERY] Filter for items whose unique_key is a given string."
"filter_published=true:[QUERY] Filter for skus that have been published."
          "filter_published=false:[QUERY] Filter for skus that have been published."
"filter_displayable=true:[QUERY] Filter for items that are displayable."
          "filter_displayable=false:[QUERY] Filter for items that are displayable."
"filter_start=:[QUERY] A comma separated string without spaces.  First value is the operator to search on, second value is the store start date, a unix timestamp in seconds.  Allowed operators: (LT, GT, LTE, GTE, EQ)."
"filter_end=:[QUERY] A comma separated string without spaces.  First value is the operator to search on, second value is the store end date, a unix timestamp in seconds.  Allowed operators: (LT, GT, LTE, GTE, EQ)."
"filter_start_date=:[QUERY] A comma separated string without spaces.  First value is the operator to search on, second value is the sku start date, a unix timestamp in seconds.  Allowed operators: (LT, GT, LTE, GTE, EQ)."
"filter_stop_date=:[QUERY] A comma separated string without spaces.  First value is the operator to search on, second value is the sku end date, a unix timestamp in seconds.  Allowed operators: (LT, GT, LTE, GTE, EQ)."
"filter_sku=:[QUERY] Filter for skus whose name starts with a given string."
"filter_price=:[QUERY] A colon separated string without spaces.  First value is the operator to search on, second value is the price of a sku.  Allowed operators: (LT, GT, LTE, GTE, EQ)."
"filter_tag=:[QUERY] A comma separated list without spaces of the names of tags. Will only return items with at least one of the tags."
"filter_items_by_type=:[QUERY] Filter for item type based on its type hint."
"filter_bundled_skus=:[QUERY] Filter for skus inside bundles whose name starts with a given string.  Used only when type hint is &#39;bundle_item&#39;"
"filter_vendor=:[QUERY] Filter for items from a given vendor, by id."
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateStoreItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the item"
          "cascade=true:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          "cascade=false:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createBundleItem)
        local -a _op_arguments
        _op_arguments=(
                    "cascade=true:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          "cascade=false:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createBundleTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteBundleItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the bundle"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteBundleTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] force deleting the template if it&#39;s attached to other objects, cascade &#x3D; detach"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBundleItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the bundle"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBundleTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getBundleTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateBundleItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the bundle"
          "cascade=true:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          "cascade=false:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateBundleTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCouponItem)
        local -a _op_arguments
        _op_arguments=(
                    "cascade=true:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          "cascade=false:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCouponTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCouponItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the coupon"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCouponTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] force deleting the template if it&#39;s attached to other objects, cascade &#x3D; detach"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCouponItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the coupon"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCouponTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCouponTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCouponItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the coupon"
          "cascade=true:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          "cascade=false:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCouponTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCatalogSale)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCatalogSale)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the sale"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCatalogSale)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the sale"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCatalogSales)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCatalogSale)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the sale"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createShippingItem)
        local -a _op_arguments
        _op_arguments=(
                    "cascade=true:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          "cascade=false:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createShippingTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteShippingItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the shipping item"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteShippingTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] force deleting the template if it&#39;s attached to other objects, cascade &#x3D; detach"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getShippingItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the shipping item"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getShippingTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getShippingTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateShippingItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the shipping item"
          "cascade=true:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          "cascade=false:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateShippingTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addCustomDiscount)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the cart"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addDiscountToCart)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the cart"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addItemToCart)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the cart"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCart)
        local -a _op_arguments
        _op_arguments=(
                    "owner=:[QUERY] Set the owner of a cart. If not specified, defaults to the calling user&#39;s id. If specified and is not the calling user&#39;s id, SHOPPING_CARTS_ADMIN permission is required"
"currency_code=:[QUERY] Set the currency for the cart, by currency code. May be disallowed by site settings."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCart)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the cart"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCarts)
        local -a _op_arguments
        _op_arguments=(
                    "filter_owner_id=:[QUERY] Filter by the id of the owner"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getShippable)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the cart"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getShippingCountries)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the cart"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removeDiscountFromCart)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the cart"
"code=:[PATH] The SKU code of the coupon to remove"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setCartCurrency)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the cart"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setCartOwner)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the cart"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateItemInCart)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the cart"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateShippingAddress)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the cart"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createSubscription)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createSubscriptionTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSubscription)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the subscription"
"plan_id=:[PATH] The id of the plan"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteSubscriptionTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] force deleting the template if it&#39;s attached to other objects, cascade &#x3D; detach"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getSubscription)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the subscription"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getSubscriptionTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getSubscriptionTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getSubscriptions)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      processSubscriptions)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSubscription)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the subscription"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateSubscriptionTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createVendor)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createVendorTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteVendor)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the vendor"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteVendorTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] force deleting the template if it&#39;s attached to other objects, cascade &#x3D; detach"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getVendor)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the vendor"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getVendorTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getVendorTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getVendors)
        local -a _op_arguments
        _op_arguments=(
                    "filter_name=:[QUERY] Filters vendors by name starting with the text provided in the filter"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateVendor)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the vendor"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateVendorTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCountryTax)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createStateTax)
        local -a _op_arguments
        _op_arguments=(
          "country_code_iso3=:[PATH] The iso3 code of the country"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCountryTax)
        local -a _op_arguments
        _op_arguments=(
          "country_code_iso3=:[PATH] The iso3 code of the country"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteStateTax)
        local -a _op_arguments
        _op_arguments=(
          "country_code_iso3=:[PATH] The iso3 code of the country"
"state_code=:[PATH] The code of the state"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCountryTax)
        local -a _op_arguments
        _op_arguments=(
          "country_code_iso3=:[PATH] The iso3 code of the country"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCountryTaxes)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getStateTax)
        local -a _op_arguments
        _op_arguments=(
          "country_code_iso3=:[PATH] The iso3 code of the country"
"state_code=:[PATH] The code of the state"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getStateTaxesForCountries)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getStateTaxesForCountry)
        local -a _op_arguments
        _op_arguments=(
          "country_code_iso3=:[PATH] The iso3 code of the country"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCountryTax)
        local -a _op_arguments
        _op_arguments=(
          "country_code_iso3=:[PATH] The iso3 code of the country"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateStateTax)
        local -a _op_arguments
        _op_arguments=(
          "country_code_iso3=:[PATH] The iso3 code of the country"
"state_code=:[PATH] The code of the state"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getTemplatePropertyType)
        local -a _op_arguments
        _op_arguments=(
          "type=:[PATH] type"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getTemplatePropertyTypes)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addUserTag)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createUserTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteUserTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUser)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the user or &#39;me&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserTags)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUsers)
        local -a _op_arguments
        _op_arguments=(
                    "filter_displayname=:[QUERY] Filter for users whose display name starts with provided string."
"filter_email=:[QUERY] Filter for users whose email starts with provided string. Requires USERS_ADMIN permission"
"filter_firstname=:[QUERY] Filter for users whose first name starts with provided string. Requires USERS_ADMIN permission"
"filter_fullname=:[QUERY] Filter for users whose full name starts with provided string. Requires USERS_ADMIN permission"
"filter_lastname=:[QUERY] Filter for users whose last name starts with provided string. Requires USERS_ADMIN permission"
"filter_username=:[QUERY] Filter for users whose username starts with the provided string. Requires USERS_ADMIN permission"
"filter_tag=:[QUERY] Filter for users who have a given tag"
"filter_group=:[QUERY] Filter for users in a given group, by unique name"
"filter_role=:[QUERY] Filter for users with a given role"
"filter_search=:[QUERY] Filter for users whose display_name starts with the provided string, or username if display_name is null"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      passwordReset)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the user"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      registerUser)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removeUserTag)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"tag=:[PATH] The tag to remove"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setPassword)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the user"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      startPasswordReset)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the user"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateUser)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the user or &#39;me&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateUserTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createAddress)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteAddress)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"id=:[PATH] The id of the address"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAddress)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"id=:[PATH] The id of the address"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAddresses)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateAddress)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"id=:[PATH] The id of the address"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addFriend)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user or &#39;me&#39; if logged in"
"id=:[PATH] The id of the user to befriend"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getFriends)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user or &#39;me&#39;"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getInviteToken)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user or &#39;me&#39; if logged in"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getInvites)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user or &#39;me&#39;"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      redeemFriendshipToken)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user or &#39;me&#39; if logged in"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removeOrDeclineFriend)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user or &#39;me&#39; if logged in"
"id=:[PATH] The id of the user to befriend"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addMemberToGroup)
        local -a _op_arguments
        _op_arguments=(
          "unique_name=:[PATH] The group unique name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createGroup)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createGroupTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteGroup)
        local -a _op_arguments
        _op_arguments=(
          "unique_name=:[PATH] The group unique name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteGroupTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getGroup)
        local -a _op_arguments
        _op_arguments=(
          "unique_name=:[PATH] The group unique name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getGroupMember)
        local -a _op_arguments
        _op_arguments=(
          "unique_name=:[PATH] The group unique name"
"user_id=:[PATH] The id of the user"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getGroupMembers)
        local -a _op_arguments
        _op_arguments=(
          "unique_name=:[PATH] The group unique name"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getGroupTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getGroupTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] a comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getGroupsForUser)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removeGroupMember)
        local -a _op_arguments
        _op_arguments=(
          "unique_name=:[PATH] The group unique name"
"user_id=:[PATH] The id of the user to remove"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateGroup)
        local -a _op_arguments
        _op_arguments=(
          "unique_name=:[PATH] The group unique name"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateGroupMemberStatus)
        local -a _op_arguments
        _op_arguments=(
          "unique_name=:[PATH] The group unique name"
"user_id=:[PATH] The user id of the member to modify"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateGroupTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateGroups)
        local -a _op_arguments
        _op_arguments=(
                    "filter_template=:[QUERY] Filter for groups using a specific template, by id"
"filter_member_count=:[QUERY] Filters groups by member count. Multiple values possible for range search. Format: filter_member_count&#x3D;OP,ts&amp;... where OP in (GT, LT, GOE, LOE, EQ). Ex: filter_member_count&#x3D;GT,14,LT,17"
"filter_name=:[QUERY] Filter for groups with names starting with the given string"
"filter_unique_name=:[QUERY] Filter for groups whose unique_name starts with provided string"
"filter_parent=:[QUERY] Filter for groups with a specific parent, by unique name"
"filter_status=:[QUERY] Filter for groups with a certain status"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addItemToUserInventory)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the user"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      checkUserEntitlementItem)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user to check for or &#39;me&#39; for logged in user"
"item_id=:[PATH] The id of the item"
          "sku=:[QUERY] The specific sku of an entitlement list addition to check entitlement for. This is of very limited and specific use and should generally be left out"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createEntitlementItem)
        local -a _op_arguments
        _op_arguments=(
                    "cascade=true:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          "cascade=false:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createEntitlementTemplate)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteEntitlementItem)
        local -a _op_arguments
        _op_arguments=(
          "entitlement_id=:[PATH] The id of the entitlement"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteEntitlementTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
          "cascade=:[QUERY] The value needed to delete used templates"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getEntitlementItem)
        local -a _op_arguments
        _op_arguments=(
          "entitlement_id=:[PATH] The id of the entitlement"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getEntitlementItems)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getEntitlementTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getEntitlementTemplates)
        local -a _op_arguments
        _op_arguments=(
                    "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"order=:[QUERY] A comma separated list of sorting requirements in priority order, each entry matching PROPERTY_NAME:[ASC|DESC]"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserInventories)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the user"
          "inactive=true:[QUERY] If true, accepts inactive user inventories"
          "inactive=false:[QUERY] If true, accepts inactive user inventories"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"filter_item_name=:[QUERY] Filter by items whose name starts with a string"
"filter_item_id=:[QUERY] Filter by item id"
"filter_username=:[QUERY] Filter by entries owned by the user with the specified username"
"filter_group=:[QUERY] Filter by entries owned by the users in a given group, by unique name"
"filter_date=:[QUERY] A comma separated string without spaces.  First value is the operator to search on, second value is the log start date, a unix timestamp in seconds. Can be repeated for a range, eg: GT,123,LT,456  Allowed operators: (GT, LT, EQ, GOE, LOE)."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserInventory)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the inventory owner or &#39;me&#39; for the logged in user"
"id=:[PATH] The id of the user inventory"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserInventoryLog)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the inventory owner or &#39;me&#39; for the logged in user"
"id=:[PATH] The id of the user inventory"
          "size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUsersInventory)
        local -a _op_arguments
        _op_arguments=(
                    "inactive=true:[QUERY] If true, accepts inactive user inventories"
          "inactive=false:[QUERY] If true, accepts inactive user inventories"
"size=:[QUERY] The number of objects returned per page"
"page=:[QUERY] The number of the page returned, starting with 1"
"filter_item_name=:[QUERY] Filter by items whose name starts with a string"
"filter_item_id=:[QUERY] Filter by item id"
"filter_username=:[QUERY] Filter by entries owned by the user with the specified username"
"filter_group=:[QUERY] Filter by entries owned by the users in a given group, by unique name"
"filter_date=:[QUERY] A comma separated string without spaces.  First value is the operator to search on, second value is the log start date, a unix timestamp in seconds. Can be repeated for a range, eg: GT,123,LT,456  Allowed operators: (GT, LT, EQ, GOE, LOE)."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      grantUserEntitlement)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user to grant the entitlement to"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateEntitlementItem)
        local -a _op_arguments
        _op_arguments=(
          "entitlement_id=:[PATH] The id of the entitlement"
          "cascade=true:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          "cascade=false:[QUERY] Whether to cascade group changes, such as in the limited gettable behavior. A 400 error will return otherwise if the group is already in use with different values."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateEntitlementTemplate)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the template"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateUserInventoryBehaviorData)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"id=:[PATH] The id of the user inventory"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateUserInventoryExpires)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] user_id"
"id=:[PATH] The id of the user inventory"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateUserInventoryStatus)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"id=:[PATH] The id of the user inventory"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      useUserEntitlementItem)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user to check for or &#39;me&#39; for logged in user"
"item_id=:[PATH] The id of the item"
          "sku=:[QUERY] The specific sku of an entitlement_list addition to check entitlement for. This is of very limited and specific use and should generally be left out"
"info=:[QUERY] Any additional info to add to the log about this use"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createUserRelationship)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteUserRelationship)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the relationship"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserRelationship)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the relationship"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserRelationships)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateUserRelationship)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The id of the relationship"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserSubscriptionDetails)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"inventory_id=:[PATH] The id of the user&#39;s inventory"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUsersSubscriptionDetails)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      reactivateUserSubscription)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"inventory_id=:[PATH] The id of the user&#39;s inventory"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setSubscriptionBillDate)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"inventory_id=:[PATH] The id of the user&#39;s inventory"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setSubscriptionPaymentMethod)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"inventory_id=:[PATH] The id of the user&#39;s inventory"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setSubscriptionStatus)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"inventory_id=:[PATH] The id of the user&#39;s inventory"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setUserSubscriptionPlan)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] The id of the user"
"inventory_id=:[PATH] The id of the user&#39;s inventory"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      sendBatch)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getHealth)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteMaintenance)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getMaintenance)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setMaintenance)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateMaintenance)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserLocationLog)
        local -a _op_arguments
        _op_arguments=(
                    "user_id=:[QUERY] The user id"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserTokenDetails)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getVersion)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
    esac
    ;;

esac

return ret
