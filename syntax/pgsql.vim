" Vim syntax file
" Language: pgsql
" URL:      https://github.com/hiqsol/pgsql.vim
" based on https://github.com/exu/pgsql.vim
" simplified for performance
" splited keywords and statements

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Always ignore case
syn case ignore

" General keywords which don't fall into other categories
syn keyword pgsqlKeyword    abort alter aggregate analyze and as alias add
syn keyword pgsqlKeyword    begin before
syn keyword pgsqlKeyword    called conversion cascade current_date current_time current_timestamp class close
syn keyword pgsqlKeyword    cluster checkpoint check comment
syn keyword pgsqlKeyword    cast cascade character check column columns constraint create copy
syn keyword pgsqlKeyword    database domain databases default distinct drop declare deallocate
syn keyword pgsqlKeyword    deferrable deferred defaults do diagnostics
syn keyword pgsqlKeyword    explain end exists exclusion found exception each exit
syn keyword pgsqlKeyword    function foreign full fetch force for
syn keyword pgsqlKeyword    grant global get
syn keyword pgsqlKeyword    index input immutable inner initially immediate inherits instead in if
syn keyword pgsqlKeyword    key language lock local load loop
syn keyword pgsqlKeyword    move match
syn keyword pgsqlKeyword    notify no new next
syn keyword pgsqlKeyword    or operator outer old on out open
syn keyword pgsqlKeyword    prepare primary password primary privilege procedure partial prepared
syn keyword pgsqlKeyword    partition preserve
syn keyword pgsqlKeyword    role replace reindex release reset revoke rollback references row rows rule restrict
syn keyword pgsqlKeyword    recursive returns return
syn keyword pgsqlKeyword    strict schema sequence savepoint simple system stable setof
syn keyword pgsqlKeyword    then truncate to tranaction trigger table tables temp temporary tablespace type
syn keyword pgsqlKeyword    unique unlisten using
syn keyword pgsqlKeyword    verbose view varying vacuum volatile with

syn keyword pgsqlStatement  select from into values where insert update set delete
syn keyword pgsqlStatement  left right join order by group limit offset having
syn keyword pgsqlStatement  execute perform return returning
syn keyword pgsqlStatement  and or asc desc null

" Operators
syn keyword pgsqlOperator   between not is in like regexp rlike binary exists isnull
syn keyword pgsqlOperator   begin end declare union all except

" Conditional
syn keyword pgsqlConditional if then else elsif case when

" Exception
syn keyword pgsqlException  raise notice exception

" Functions
syn keyword pgsqlFunction   coalesce nullif count max min sum now

" Boolean constants
syn keyword pgsqlBoolean    false true

" Strings (single- and double-quote)
syn region pgsqlString      start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region pgsqlString      start=+'+  skip=+\\\\\|\\'+  end=+'+

" Numbers and hexidecimal values
syn match pgsqlNumber       "-\=\<[0-9]*\>"
syn match pgsqlNumber       "-\=\<[0-9]*\.[0-9]*\>"
syn match pgsqlNumber       "-\=\<[0-9]*e[+-]\=[0-9]*\>"
syn match pgsqlNumber       "-\=\<[0-9]*\.[0-9]*e[+-]\=[0-9]*\>"
syn match pgsqlNumber       "\<0x[abcdefABCDEF0-9]*\>"

" User variables
syn match pgsqlVariable     "@\a*[A-Za-z0-9]*[._]*[A-Za-z0-9]*"

" Comments (c-style, pgsql-style and modified sql-style)
syn region pgsqlComment     start="/\*"  end="\*/"
syn match pgsqlComment      "#.*"
syn match pgsqlComment      "--.*"
syn sync ccomment pgsqlComment

" Types
syn keyword pgsqlType       array anyarray anyelement abstime anyenum
syn keyword pgsqlType       anynonarray any aclitem bytea bit
syn keyword pgsqlType       boolean bigint box cidr cstring char
syn keyword pgsqlType       character cid circle double date
syn keyword pgsqlType       gtsvector inet interval internal
syn keyword pgsqlType       int2vector integer line lseg
syn keyword pgsqlType       language_handler macaddr money numeric
syn keyword pgsqlType       opaque oidvector oid polygon point
syn keyword pgsqlType       path period precision regclass real
syn keyword pgsqlType       regtype refcursor regoperator reltime
syn keyword pgsqlType       record regproc regdictionary regoper
syn keyword pgsqlType       regprocedure regconfig smgr smallint
syn keyword pgsqlType       time tsquery tinterval trigger tid
syn keyword pgsqlType       timestamp text tsvector txid_snapshot
syn keyword pgsqlType       unknown uuid void varying with without
syn keyword pgsqlType       xml xid zone

syn region pgsqlType        start="float\W" end="."me=s-1
syn region pgsqlType        start="float$" end="."me=s-1
syn region pgsqlType        start="float(" end=")" contains=pgsqlNumber,pgsqlVariable
syn region pgsqlType        start="double\W" end="."me=s-1
syn region pgsqlType        start="double$" end="."me=s-1
syn region pgsqlType        start="double(" end=")" contains=pgsqlNumber,pgsqlVariable
syn region pgsqlType        start="double precision\W" end="."me=s-1
syn region pgsqlType        start="double precision$" end="."me=s-1
syn region pgsqlType        start="double precision(" end=")" contains=pgsqlNumber,pgsqlVariable
syn region pgsqlType        start="real\W" end="."me=s-1
syn region pgsqlType        start="real$" end="."me=s-1
syn region pgsqlType        start="real(" end=")" contains=pgsqlNumber,pgsqlVariable
syn region pgsqlType        start="numeric(" end=")" contains=pgsqlNumber,pgsqlVariable
syn region pgsqlType        start="decimal(" end=")" contains=pgsqlNumber,pgsqlVariable
syn region pgsqlType        start="\Wtimestamp\W" end="."me=s-1
syn region pgsqlType        start="\Wtimestamp$" end="."me=s-1
syn region pgsqlType        start="\Wtimestamp(" end=")" contains=pgsqlNumber,pgsqlVariable
syn region pgsqlType        start="^timestamp\W" end="."me=s-1
syn region pgsqlType        start="^timestamp$" end="."me=s-1
syn region pgsqlType        start="^timestamp(" end=")" contains=pgsqlNumber,pgsqlVariable
syn region pgsqlType        start="\Wyear(" end=")" contains=pgsqlNumber,pgsqlVariable
syn region pgsqlType        start="^year(" end=")" contains=pgsqlNumber,pgsqlVariable
syn region pgsqlType        start="^char(" end=")" contains=pgsqlNumber,pgsqlVariable
syn region pgsqlType        start="^varchar(" end=")" contains=pgsqlNumber,pgsqlVariable
syn region pgsqlType        start="\Wset(" end=")" contains=pgsqlString,pgsqlVariable
syn region pgsqlType        start="^set(" end=")" contains=pgsqlString,pgsqlVariable

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_pgsql_syn_inits")
    if version < 508
        let did_pgsql_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink pgsqlKeyword       Keyword
    HiLink pgsqlBoolean       Boolean
    HiLink pgsqlString        String
    HiLink pgsqlNumber        Number
    HiLink pgsqlVariable      Identifier
    HiLink pgsqlComment       Comment
    HiLink pgsqlType          Type
    HiLink pgsqlOperator      Operator
    HiLink pgsqlConditional   Conditional
    HiLink pgsqlStatement     Statement
    HiLink pgsqlException     Exception
    HiLink pgsqlFunction      Function
    delcommand HiLink
endif

let b:current_syntax = "pgsql"
