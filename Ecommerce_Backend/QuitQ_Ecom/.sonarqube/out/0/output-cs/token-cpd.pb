˚
`D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\WishlistService.cs
	namespace

 	
EcomLib


 
.

 
Service

 
{ 
public 

class 
WishlistService  
{ 
private 
readonly 
IWishlistRepository ,
_wishlistRepository- @
;@ A
public 
WishlistService 
( 
IWishlistRepository 2
wishlistRepository3 E
)E F
{ 	
_wishlistRepository 
=  !
wishlistRepository" 4
;4 5
} 	
public 
async 
Task 
AddToWishlist '
(' (
int( +
userId, 2
,2 3
int4 7
	productId8 A
)A B
{ 	
await 
_wishlistRepository %
.% &
AddToWishlist& 3
(3 4
userId4 :
,: ;
	productId< E
)E F
;F G
} 	
public 
async 
Task 
< 
List 
< 
WishlistProductDTO 1
>1 2
>2 3
GetUserWishlist4 C
(C D
intD G
userIdH N
)N O
{ 	
return 
await 
_wishlistRepository ,
., -
GetUserWishlist- <
(< =
userId= C
)C D
;D E
} 	
public 
async 
Task 
RemoveFromWishlist ,
(, -
int- 0
userId1 7
,7 8
int9 <
	productId= F
)F G
{   	
await!! 
_wishlistRepository!! %
.!!% &
RemoveFromWishlist!!& 8
(!!8 9
userId!!9 ?
,!!? @
	productId!!A J
)!!J K
;!!K L
}"" 	
}## 
}%% ú≈
\D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\UserService.cs
	namespace 	
EcomLib
 
. 
Service 
{ 
public 

class 
UserService 
{ 
private 
readonly 
IUserRepository (
_userRepository) 8
;8 9
public 
UserService 
( 
IUserRepository *
userRepository+ 9
)9 :
{ 	
_userRepository 
= 
userRepository ,
;, -
} 	
public 
async 
Task 
< 
int 
> 
RegisterUserAsync 0
(0 1
RegisterUserDTO1 @
registerUserDtoA P
)P Q
{ 	
if 
( 
await 
_userRepository %
.% &
GetUserByEmailAsync& 9
(9 :
registerUserDto: I
.I J
EmailJ O
)O P
!=Q S
nullT X
)X Y
{ 
throw 
new !
InvalidInputException /
(/ 0
$str0 X
)X Y
;Y Z
} 
var 
user 
= 
new 
User 
{ 
Username   
=   
registerUserDto   *
.  * +
Username  + 3
,  3 4
PasswordHash!! 
=!! 
HashPassword!! +
(!!+ ,
registerUserDto!!, ;
.!!; <
Password!!< D
)!!D E
,!!E F
Email"" 
="" 
registerUserDto"" '
.""' (
Email""( -
,""- .
Role## 
=## 
UserRole## 
.##  
User##  $
,##$ %
IsActive$$ 
=$$ 
true$$ 
,$$  
DateCreated%% 
=%% 
DateTime%% &
.%%& '
Now%%' *
,%%* +
PersonalDetails&& 
=&&  !
new&&" %
PersonalDetails&&& 5
{'' 
	FirstName(( 
=(( 
registerUserDto((  /
.((/ 0
PersonalDetails((0 ?
.((? @
	FirstName((@ I
,((I J
LastName)) 
=)) 
registerUserDto)) .
.)). /
PersonalDetails))/ >
.))> ?
LastName))? G
,))G H
Gender** 
=** 
registerUserDto** ,
.**, -
PersonalDetails**- <
.**< =
Gender**= C
,**C D
DateOfBirth++ 
=++  !
registerUserDto++" 1
.++1 2
PersonalDetails++2 A
.++A B
DateOfBirth++B M
,++M N
PhoneNumber,, 
=,,  !
registerUserDto,," 1
.,,1 2
PersonalDetails,,2 A
.,,A B
PhoneNumber,,B M
}-- 
,-- 
Address.. 
=.. 
new.. 
Address.. %
{// 
AddressLine100  
=00! "
registerUserDto00# 2
.002 3
Address003 :
.00: ;
AddressLine100; G
,00G H
AddressLine211  
=11! "
registerUserDto11# 2
.112 3
Address113 :
.11: ;
AddressLine211; G
,11G H
City22 
=22 
registerUserDto22 *
.22* +
Address22+ 2
.222 3
City223 7
,227 8
State33 
=33 
registerUserDto33 +
.33+ ,
Address33, 3
.333 4
State334 9
,339 :

PostalCode44 
=44  
registerUserDto44! 0
.440 1
Address441 8
.448 9

PostalCode449 C
,44C D
Country55 
=55 
registerUserDto55 -
.55- .
Address55. 5
.555 6
Country556 =
}66 
}77 
;77 
var99 
	newUserId99 
=99 
await99 !
_userRepository99" 1
.991 2
AddUserAsync992 >
(99> ?
user99? C
)99C D
;99D E
await:: 
_userRepository:: !
.::! "
LogUserAction::" /
(::/ 0
	newUserId::0 9
,::9 :
$str::; E
,::E F
$str::G N
,::N O
	newUserId::P Y
,::Y Z
$str::[ r
)::r s
;::s t
return;; 
	newUserId;; 
;;; 
}<< 	
public?? 
async?? 
Task?? 
<?? 
int?? 
>?? 
RegisterSellerAsync?? 2
(??2 3
RegisterSellerDTO??3 D
registerSellerDto??E V
)??V W
{@@ 	
ifAA 
(AA 
awaitAA 
_userRepositoryAA %
.AA% &
GetUserByEmailAsyncAA& 9
(AA9 :
registerSellerDtoAA: K
.AAK L
EmailAAL Q
)AAQ R
!=AAS U
nullAAV Z
)AAZ [
{BB 
throwCC 
newCC !
InvalidInputExceptionCC /
(CC/ 0
$strCC0 Z
)CCZ [
;CC[ \
}DD 
varFF 
userFF 
=FF 
newFF 
UserFF 
{GG 
UsernameHH 
=HH 
registerSellerDtoHH ,
.HH, -
UsernameHH- 5
,HH5 6
PasswordHashII 
=II 
HashPasswordII +
(II+ ,
registerSellerDtoII, =
.II= >
PasswordII> F
)IIF G
,IIG H
EmailJJ 
=JJ 
registerSellerDtoJJ )
.JJ) *
EmailJJ* /
,JJ/ 0
RoleKK 
=KK 
UserRoleKK 
.KK  
SellerKK  &
,KK& '
IsActiveLL 
=LL 
trueLL 
,LL  
DateCreatedMM 
=MM 
DateTimeMM &
.MM& '
NowMM' *
,MM* +
PersonalDetailsNN 
=NN  !
newNN" %
PersonalDetailsNN& 5
{OO 
	FirstNamePP 
=PP 
registerSellerDtoPP  1
.PP1 2
PersonalDetailsPP2 A
.PPA B
	FirstNamePPB K
,PPK L
LastNameQQ 
=QQ 
registerSellerDtoQQ 0
.QQ0 1
PersonalDetailsQQ1 @
.QQ@ A
LastNameQQA I
,QQI J
GenderRR 
=RR 
registerSellerDtoRR .
.RR. /
PersonalDetailsRR/ >
.RR> ?
GenderRR? E
,RRE F
DateOfBirthSS 
=SS  !
registerSellerDtoSS" 3
.SS3 4
PersonalDetailsSS4 C
.SSC D
DateOfBirthSSD O
,SSO P
PhoneNumberTT 
=TT  !
registerSellerDtoTT" 3
.TT3 4
PersonalDetailsTT4 C
.TTC D
PhoneNumberTTD O
}UU 
,UU 
AddressVV 
=VV 
newVV 
AddressVV %
{WW 
AddressLine1XX  
=XX! "
registerSellerDtoXX# 4
.XX4 5
AddressXX5 <
.XX< =
AddressLine1XX= I
,XXI J
AddressLine2YY  
=YY! "
registerSellerDtoYY# 4
.YY4 5
AddressYY5 <
.YY< =
AddressLine2YY= I
,YYI J
CityZZ 
=ZZ 
registerSellerDtoZZ ,
.ZZ, -
AddressZZ- 4
.ZZ4 5
CityZZ5 9
,ZZ9 :
State[[ 
=[[ 
registerSellerDto[[ -
.[[- .
Address[[. 5
.[[5 6
State[[6 ;
,[[; <

PostalCode\\ 
=\\  
registerSellerDto\\! 2
.\\2 3
Address\\3 :
.\\: ;

PostalCode\\; E
,\\E F
Country]] 
=]] 
registerSellerDto]] /
.]]/ 0
Address]]0 7
.]]7 8
Country]]8 ?
}^^ 
,^^ 
SellerDetails__ 
=__ 
new__  #
SellerDetails__$ 1
{`` 
CompanyNameaa 
=aa  !
registerSellerDtoaa" 3
.aa3 4
SellerDetailsaa4 A
.aaA B
CompanyNameaaB M
,aaM N%
CompanyRegistrationNumberbb -
=bb. /
registerSellerDtobb0 A
.bbA B
SellerDetailsbbB O
.bbO P%
CompanyRegistrationNumberbbP i
,bbi j
	GSTNumbercc 
=cc 
registerSellerDtocc  1
.cc1 2
SellerDetailscc2 ?
.cc? @
	GSTNumbercc@ I
,ccI J
BusinessTypedd  
=dd! "
registerSellerDtodd# 4
.dd4 5
SellerDetailsdd5 B
.ddB C
BusinessTypeddC O
}ee 
}ff 
;ff 
varhh 
newSellerIdhh 
=hh 
awaithh "
_userRepositoryhh# 2
.hh2 3
AddUserAsynchh3 ?
(hh? @
userhh@ D
)hhD E
;hhE F
awaitii 
_userRepositoryii !
.ii! "
LogUserActionii" /
(ii/ 0
newSellerIdii0 ;
,ii; <
$strii= G
,iiG H
$striiI P
,iiP Q
newSellerIdiiR ]
,ii] ^
$strii_ x
)iix y
;iiy z
returnjj 
newSellerIdjj 
;jj 
}kk 	
publicll 
asyncll 
Taskll 
UpdateUserAsyncll )
(ll) *
UserDTOll* 1
userDtoll2 9
,ll9 :
intll; >
userIdll? E
)llE F
{mm 	
varnn 
usernn 
=nn 
awaitnn 
_userRepositorynn ,
.nn, -
GetUserByIdAsyncnn- =
(nn= >
userIdnn> D
)nnD E
;nnE F
ifoo 
(oo 
useroo 
==oo 
nulloo 
)oo 
{pp 
throwqq 
newqq !
UserNotFoundExceptionqq /
(qq/ 0
$"qq0 2
$strqq2 ?
{qq? @
userIdqq@ F
}qqF G
$strqqG _
"qq_ `
)qq` a
;qqa b
}rr 
awaitss 
_userRepositoryss !
.ss! "
UpdateUserAsyncss" 1
(ss1 2
userDtoss2 9
,ss9 :
userIdss; A
)ssA B
;ssB C
}tt 	
publicww 
asyncww 
Taskww 
UpdateAddressAsyncww ,
(ww, -
intww- 0
userIdww1 7
,ww7 8

AddressDTOww9 C

addressDtowwD N
)wwN O
{xx 	
varyy 
useryy 
=yy 
awaityy 
_userRepositoryyy ,
.yy, -
GetUserByIdyy- 8
(yy8 9
userIdyy9 ?
)yy? @
;yy@ A
ifzz 
(zz 
userzz 
==zz 
nullzz 
)zz 
{{{ 
throw|| 
new|| !
UserNotFoundException|| /
(||/ 0
$"||0 2
$str||2 ?
{||? @
userId||@ F
}||F G
$str||G _
"||_ `
)||` a
;||a b
}}} 
user 
. 
Address 
. 
AddressLine1 %
=& '

addressDto( 2
.2 3
AddressLine13 ?
;? @
user
ÄÄ 
.
ÄÄ 
Address
ÄÄ 
.
ÄÄ 
AddressLine2
ÄÄ %
=
ÄÄ& '

addressDto
ÄÄ( 2
.
ÄÄ2 3
AddressLine2
ÄÄ3 ?
;
ÄÄ? @
user
ÅÅ 
.
ÅÅ 
Address
ÅÅ 
.
ÅÅ 
City
ÅÅ 
=
ÅÅ 

addressDto
ÅÅ  *
.
ÅÅ* +
City
ÅÅ+ /
;
ÅÅ/ 0
user
ÇÇ 
.
ÇÇ 
Address
ÇÇ 
.
ÇÇ 
State
ÇÇ 
=
ÇÇ  

addressDto
ÇÇ! +
.
ÇÇ+ ,
State
ÇÇ, 1
;
ÇÇ1 2
user
ÉÉ 
.
ÉÉ 
Address
ÉÉ 
.
ÉÉ 

PostalCode
ÉÉ #
=
ÉÉ$ %

addressDto
ÉÉ& 0
.
ÉÉ0 1

PostalCode
ÉÉ1 ;
;
ÉÉ; <
user
ÑÑ 
.
ÑÑ 
Address
ÑÑ 
.
ÑÑ 
Country
ÑÑ  
=
ÑÑ! "

addressDto
ÑÑ# -
.
ÑÑ- .
Country
ÑÑ. 5
;
ÑÑ5 6
await
ÜÜ 
_userRepository
ÜÜ !
.
ÜÜ! "
UpdateUserAsync
ÜÜ" 1
(
ÜÜ1 2
user
ÜÜ2 6
)
ÜÜ6 7
;
ÜÜ7 8
}
áá 	
public
åå 
async
åå 
Task
åå &
UpdateSellerDetailsAsync
åå 2
(
åå2 3
int
åå3 6
userId
åå7 =
,
åå= >
SellerDetailsDTO
åå? O
sellerDetailsDto
ååP `
)
åå` a
{
çç 	
var
éé 
user
éé 
=
éé 
await
éé 
_userRepository
éé ,
.
éé, -
GetUserById
éé- 8
(
éé8 9
userId
éé9 ?
)
éé? @
;
éé@ A
if
èè 
(
èè 
user
èè 
==
èè 
null
èè 
)
èè 
{
êê 
throw
ëë 
new
ëë #
UserNotFoundException
ëë /
(
ëë/ 0
$"
ëë0 2
$str
ëë2 ?
{
ëë? @
userId
ëë@ F
}
ëëF G
$str
ëëG _
"
ëë_ `
)
ëë` a
;
ëëa b
}
íí 
user
îî 
.
îî 
SellerDetails
îî 
=
îî  
new
îî! $
SellerDetails
îî% 2
{
ïï 
CompanyName
ññ 
=
ññ 
sellerDetailsDto
ññ .
.
ññ. /
CompanyName
ññ/ :
,
ññ: ;'
CompanyRegistrationNumber
óó )
=
óó* +
sellerDetailsDto
óó, <
.
óó< ='
CompanyRegistrationNumber
óó= V
,
óóV W
	GSTNumber
òò 
=
òò 
sellerDetailsDto
òò ,
.
òò, -
	GSTNumber
òò- 6
,
òò6 7
BusinessType
ôô 
=
ôô 
sellerDetailsDto
ôô /
.
ôô/ 0
BusinessType
ôô0 <
}
öö 
;
öö 
await
úú 
_userRepository
úú !
.
úú! "&
UpdateSellerDetailsAsync
úú" :
(
úú: ;
user
úú; ?
)
úú? @
;
úú@ A
}
ùù 	
public
†† 
async
†† 
Task
†† 
<
†† 
IEnumerable
†† %
<
††% &

GetUserDTO
††& 0
>
††0 1
>
††1 2
GetAllUsersAsync
††3 C
(
††C D
)
††D E
{
°° 	
return
¢¢ 
await
¢¢ 
_userRepository
¢¢ (
.
¢¢( )
GetAllUsersAsync
¢¢) 9
(
¢¢9 :
)
¢¢: ;
;
¢¢; <
}
££ 	
public
¶¶ 
async
¶¶ 
Task
¶¶ 
<
¶¶ 

GetUserDTO
¶¶ $
>
¶¶$ %
GetUserByIdAsync
¶¶& 6
(
¶¶6 7
int
¶¶7 :
userId
¶¶; A
)
¶¶A B
{
ßß 	
var
®® 
user
®® 
=
®® 
await
®® 
_userRepository
®® ,
.
®®, -
GetUserByIdAsync
®®- =
(
®®= >
userId
®®> D
)
®®D E
;
®®E F
if
©© 
(
©© 
user
©© 
==
©© 
null
©© 
)
©© 
{
™™ 
throw
´´ 
new
´´ #
UserNotFoundException
´´ /
(
´´/ 0
$"
´´0 2
$str
´´2 ?
{
´´? @
userId
´´@ F
}
´´F G
$str
´´G _
"
´´_ `
)
´´` a
;
´´a b
}
¨¨ 
return
≠≠ 
user
≠≠ 
;
≠≠ 
}
ÆÆ 	
public
±± 
async
±± 
Task
±± 
<
±± 

GetUserDTO
±± $
>
±±$ %$
GetUserByUsernameAsync
±±& <
(
±±< =
string
±±= C
username
±±D L
)
±±L M
{
≤≤ 	
var
≥≥ 
user
≥≥ 
=
≥≥ 
await
≥≥ 
_userRepository
≥≥ ,
.
≥≥, -$
GetUserByUsernameAsync
≥≥- C
(
≥≥C D
username
≥≥D L
)
≥≥L M
;
≥≥M N
if
¥¥ 
(
¥¥ 
user
¥¥ 
==
¥¥ 
null
¥¥ 
)
¥¥ 
{
µµ 
throw
∂∂ 
new
∂∂ #
UserNotFoundException
∂∂ /
(
∂∂/ 0
$"
∂∂0 2
$str
∂∂2 E
{
∂∂E F
username
∂∂F N
}
∂∂N O
$str
∂∂O ^
"
∂∂^ _
)
∂∂_ `
;
∂∂` a
}
∑∑ 
return
∏∏ 
user
∏∏ 
;
∏∏ 
}
ππ 	
public
ºº 
async
ºº 
Task
ºº 
<
ºº 

GetUserDTO
ºº $
>
ºº$ %!
GetUserByEmailAsync
ºº& 9
(
ºº9 :
string
ºº: @
email
ººA F
)
ººF G
{
ΩΩ 	
var
ææ 
user
ææ 
=
ææ 
await
ææ 
_userRepository
ææ ,
.
ææ, -!
GetUserByEmailAsync
ææ- @
(
ææ@ A
email
ææA F
)
ææF G
;
ææG H
if
øø 
(
øø 
user
øø 
==
øø 
null
øø 
)
øø 
{
¿¿ 
throw
¡¡ 
new
¡¡ #
UserNotFoundException
¡¡ /
(
¡¡/ 0
$"
¡¡0 2
$str
¡¡2 B
{
¡¡B C
email
¡¡C H
}
¡¡H I
$str
¡¡I X
"
¡¡X Y
)
¡¡Y Z
;
¡¡Z [
}
¬¬ 
return
√√ 
user
√√ 
;
√√ 
}
ƒƒ 	
public
∆∆ 
async
∆∆ 
Task
∆∆ 
DeleteUserAsync
∆∆ )
(
∆∆) *
int
∆∆* -
userId
∆∆. 4
)
∆∆4 5
{
«« 	
var
»» 
user
»» 
=
»» 
await
»» 
_userRepository
»» ,
.
»», -
GetUserByIdAsync
»»- =
(
»»= >
userId
»»> D
)
»»D E
;
»»E F
if
…… 
(
…… 
user
…… 
==
…… 
null
…… 
)
…… 
{
   
throw
ÀÀ 
new
ÀÀ #
UserNotFoundException
ÀÀ /
(
ÀÀ/ 0
$"
ÀÀ0 2
$str
ÀÀ2 ?
{
ÀÀ? @
userId
ÀÀ@ F
}
ÀÀF G
$str
ÀÀG _
"
ÀÀ_ `
)
ÀÀ` a
;
ÀÀa b
}
ÃÃ 
await
ÕÕ 
_userRepository
ÕÕ !
.
ÕÕ! "
DeleteUserAsync
ÕÕ" 1
(
ÕÕ1 2
userId
ÕÕ2 8
)
ÕÕ8 9
;
ÕÕ9 :
}
ŒŒ 	
public
–– 
async
–– 
Task
–– 
<
–– 
IEnumerable
–– %
<
––% &
LastRegisteredDTO
––& 7
>
––7 8
>
––8 9&
GetUsersLast24HoursAsync
––: R
(
––R S
)
––S T
{
—— 	
return
““ 
await
““ 
_userRepository
““ (
.
““( )&
GetUsersLast24HoursAsync
““) A
(
““A B
)
““B C
;
““C D
}
”” 	
public
’’ 
async
’’ 
Task
’’ 
<
’’ 
IEnumerable
’’ %
<
’’% &
LastRegisteredDTO
’’& 7
>
’’7 8
>
’’8 9$
GetUsersLast7DaysAsync
’’: P
(
’’P Q
)
’’Q R
{
÷÷ 	
return
◊◊ 
await
◊◊ 
_userRepository
◊◊ (
.
◊◊( )$
GetUsersLast7DaysAsync
◊◊) ?
(
◊◊? @
)
◊◊@ A
;
◊◊A B
}
ÿÿ 	
public
⁄⁄ 
async
⁄⁄ 
Task
⁄⁄ 
<
⁄⁄ 
IEnumerable
⁄⁄ %
<
⁄⁄% &
LastRegisteredDTO
⁄⁄& 7
>
⁄⁄7 8
>
⁄⁄8 9$
GetUsersLastMonthAsync
⁄⁄: P
(
⁄⁄P Q
)
⁄⁄Q R
{
€€ 	
return
‹‹ 
await
‹‹ 
_userRepository
‹‹ (
.
‹‹( )$
GetUsersLastMonthAsync
‹‹) ?
(
‹‹? @
)
‹‹@ A
;
‹‹A B
}
›› 	
public
ﬁﬁ 
async
ﬁﬁ 
Task
ﬁﬁ 
<
ﬁﬁ 
IEnumerable
ﬁﬁ %
<
ﬁﬁ% &%
LastRegisteredSellerDTO
ﬁﬁ& =
>
ﬁﬁ= >
>
ﬁﬁ> ?(
GetSellersLast24HoursAsync
ﬁﬁ@ Z
(
ﬁﬁZ [
)
ﬁﬁ[ \
{
ﬂﬂ 	
return
‡‡ 
await
‡‡ 
_userRepository
‡‡ (
.
‡‡( )(
GetSellersLast24HoursAsync
‡‡) C
(
‡‡C D
)
‡‡D E
;
‡‡E F
}
·· 	
public
‚‚ 
async
‚‚ 
Task
‚‚ 
<
‚‚ 
IEnumerable
‚‚ %
<
‚‚% &%
LastRegisteredSellerDTO
‚‚& =
>
‚‚= >
>
‚‚> ?&
GetSellersLast7DaysAsync
‚‚@ X
(
‚‚X Y
)
‚‚Y Z
{
„„ 	
return
‰‰ 
await
‰‰ 
_userRepository
‰‰ (
.
‰‰( )&
GetSellersLast7DaysAsync
‰‰) A
(
‰‰A B
)
‰‰B C
;
‰‰C D
}
ÂÂ 	
public
ÊÊ 
async
ÊÊ 
Task
ÊÊ 
<
ÊÊ 
IEnumerable
ÊÊ %
<
ÊÊ% &%
LastRegisteredSellerDTO
ÊÊ& =
>
ÊÊ= >
>
ÊÊ> ?&
GetSellersLastMonthAsync
ÊÊ@ X
(
ÊÊX Y
)
ÊÊY Z
{
ÁÁ 	
return
ËË 
await
ËË 
_userRepository
ËË (
.
ËË( )&
GetSellersLastMonthAsync
ËË) A
(
ËËA B
)
ËËB C
;
ËËC D
}
ÈÈ 	
public
ÎÎ 
IEnumerable
ÎÎ 
<
ÎÎ 
GetAddressDTO
ÎÎ (
>
ÎÎ( )"
GetAddressesByUserId
ÎÎ* >
(
ÎÎ> ?
int
ÎÎ? B
userId
ÎÎC I
)
ÎÎI J
{
ÏÏ 	
var
ÌÌ 
	addresses
ÌÌ 
=
ÌÌ 
_userRepository
ÌÌ +
.
ÌÌ+ ,"
GetAddressesByUserId
ÌÌ, @
(
ÌÌ@ A
userId
ÌÌA G
)
ÌÌG H
;
ÌÌH I
return
 
	addresses
 
.
 
Select
 #
(
# $
a
$ %
=>
& (
new
) ,
GetAddressDTO
- :
{
ÒÒ 
	AddressId
ÚÚ 
=
ÚÚ 
a
ÚÚ 
.
ÚÚ 
	AddressId
ÚÚ '
,
ÚÚ' (
AddressLine1
ÛÛ 
=
ÛÛ 
a
ÛÛ  
.
ÛÛ  !
AddressLine1
ÛÛ! -
,
ÛÛ- .
AddressLine2
ÙÙ 
=
ÙÙ 
a
ÙÙ  
.
ÙÙ  !
AddressLine2
ÙÙ! -
,
ÙÙ- .
City
ıı 
=
ıı 
a
ıı 
.
ıı 
City
ıı 
,
ıı 
State
ˆˆ 
=
ˆˆ 
a
ˆˆ 
.
ˆˆ 
State
ˆˆ 
,
ˆˆ  

PostalCode
˜˜ 
=
˜˜ 
a
˜˜ 
.
˜˜ 

PostalCode
˜˜ )
,
˜˜) *
Country
¯¯ 
=
¯¯ 
a
¯¯ 
.
¯¯ 
Country
¯¯ #
}
˘˘ 
)
˘˘ 
.
˘˘ 
ToList
˘˘ 
(
˘˘ 
)
˘˘ 
;
˘˘ 
}
˙˙ 	
private
˝˝ 
string
˝˝ 
HashPassword
˝˝ #
(
˝˝# $
string
˝˝$ *
password
˝˝+ 3
)
˝˝3 4
{
˛˛ 	
return
ÄÄ 
BCrypt
ÄÄ 
.
ÄÄ 
Net
ÄÄ 
.
ÄÄ 
BCrypt
ÄÄ $
.
ÄÄ$ %
HashPassword
ÄÄ% 1
(
ÄÄ1 2
password
ÄÄ2 :
)
ÄÄ: ;
;
ÄÄ; <
}
ÅÅ 	
public
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
<
ÉÉ 
	SellerDTO
ÉÉ #
>
ÉÉ# $$
GetSellerByUserIdAsync
ÉÉ% ;
(
ÉÉ; <
int
ÉÉ< ?
userId
ÉÉ@ F
)
ÉÉF G
{
ÑÑ 	
return
ÖÖ 
await
ÖÖ 
_userRepository
ÖÖ (
.
ÖÖ( )$
GetSellerByUserIdAsync
ÖÖ) ?
(
ÖÖ? @
userId
ÖÖ@ F
)
ÖÖF G
;
ÖÖG H
}
ÜÜ 	
public
àà 
async
àà 
Task
àà 
<
àà 
UserProfileDto
àà (
>
àà( )!
GetUserProfileAsync
àà* =
(
àà= >
int
àà> A
userId
ààB H
)
ààH I
{
ââ 	
return
ää 
await
ää 
_userRepository
ää (
.
ää( )%
GetUserProfileByIdAsync
ää) @
(
ää@ A
userId
ääA G
)
ääG H
;
ääH I
}
ãã 	
public
çç 
async
çç 
Task
çç $
UpdateUserProfileAsync
çç 0
(
çç0 1
UserProfileDto
çç1 ?
userProfileDto
çç@ N
)
ççN O
{
éé 	
await
èè 
_userRepository
èè !
.
èè! "$
UpdateUserProfileAsync
èè" 8
(
èè8 9
userProfileDto
èè9 G
)
èèG H
;
èèH I
}
êê 	
}
ëë 
}íí Ì
eD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\UserAnalyticsService.cs
	namespace		 	
EcomLib		
 
.		 
Service		 
{

 
public 

class  
UserAnalyticsService %
{ 
private 
readonly $
IUserAnalyticsRepository 1 
_analyticsRepository2 F
;F G
public  
UserAnalyticsService #
(# $$
IUserAnalyticsRepository$ <
analyticsRepository= P
)P Q
{ 	 
_analyticsRepository  
=! "
analyticsRepository# 6
;6 7
} 	
public 
int %
GetTotalUserRegistrations ,
(, -
)- .
{ 	
return  
_analyticsRepository '
.' (%
GetTotalUserRegistrations( A
(A B
)B C
;C D
} 	
public 
int '
GetTotalSellerRegistrations .
(. /
)/ 0
{ 	
return  
_analyticsRepository '
.' ('
GetTotalSellerRegistrations( C
(C D
)D E
;E F
} 	
public 
List 
< 
TopActiveUserDto $
>$ %
GetTopActiveUsers& 7
(7 8
int8 ;
topN< @
)@ A
{ 	
return    
_analyticsRepository   '
.  ' (
GetTopActiveUsers  ( 9
(  9 :
topN  : >
)  > ?
;  ? @
}!! 	
public## 
List## 
<## 
UserActivityLogDto## &
>##& '
GetUserActivityLog##( :
(##: ;
)##; <
{$$ 	
return%%  
_analyticsRepository%% '
.%%' (
GetUserActivityLog%%( :
(%%: ;
)%%; <
;%%< =
}&& 	
}'' 
})) ë"
fD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\SalesAnalyticsService.cs
	namespace 	
EcomLib
 
. 
Service 
{ 
public 

class !
SalesAnalyticsService &
{ 
private 
readonly %
ISalesAnalyticsRepository 2%
_salesAnalyticsRepository3 L
;L M
private 
readonly %
ISellerAnalysisRepository 2%
_sellerAnalysisRepository3 L
;L M
public !
SalesAnalyticsService $
($ %%
ISalesAnalyticsRepository% >$
salesAnalyticsRepository? W
,W X%
ISellerAnalysisRepositoryY r%
sellerAnalysisRepository	s ã
)
ã å
{ 	%
_salesAnalyticsRepository %
=& '$
salesAnalyticsRepository( @
;@ A%
_sellerAnalysisRepository %
=& '$
sellerAnalysisRepository( @
;@ A
} 	
public 
List 
< 
SalesByCategoryDto &
>& '
GetSalesByCategory( :
(: ;
); <
{ 	
return %
_salesAnalyticsRepository ,
., -
GetSalesByCategory- ?
(? @
)@ A
;A B
} 	
public 
List 
< 
SalesByProductDto %
>% &
GetSalesByProduct' 8
(8 9
)9 :
{ 	
return %
_salesAnalyticsRepository ,
., -
GetSalesByProduct- >
(> ?
)? @
;@ A
}   	
public"" 
List"" 
<"" 
SalesBySellerDto"" $
>""$ %
GetSalesBySeller""& 6
(""6 7
)""7 8
{## 	
return$$ %
_salesAnalyticsRepository$$ ,
.$$, -
GetSalesBySeller$$- =
($$= >
)$$> ?
;$$? @
}%% 	
public'' 
List'' 
<'' 
DailySalesDto'' !
>''! "
GetDailySales''# 0
(''0 1
)''1 2
{(( 	
return)) %
_salesAnalyticsRepository)) ,
.)), -
GetDailySales))- :
()): ;
))); <
;))< =
}** 	
public,, 
List,, 
<,, 
SalesByProductDto,, %
>,,% &!
GetTopSellingProducts,,' <
(,,< =
),,= >
{-- 	
return.. %
_salesAnalyticsRepository.. ,
..., -!
GetTopSellingProducts..- B
(..B C
)..C D
;..D E
}// 	
private00 
readonly00  
IOrderItemRepository00 - 
_orderItemRepository00. B
;00B C
public11 
async11 
Task11 
<11 
List11 
<11 
SalesByProductDTO11 0
>110 1
>111 2"
GetSalesByProductAsync113 I
(11I J
int11J M
sellerId11N V
)11V W
{22 	
return33 
await33 %
_sellerAnalysisRepository33 2
.332 3"
GetSalesByProductAsync333 I
(33I J
sellerId33J R
)33R S
;33S T
}44 	
public66 
async66 
Task66 
<66 
List66 
<66 
SalesByMonthDto66 .
>66. /
>66/ 0 
GetSalesByMonthAsync661 E
(66E F
int66F I
sellerId66J R
)66R S
{77 	
return88 
await88 %
_sellerAnalysisRepository88 2
.882 3 
GetSalesByMonthAsync883 G
(88G H
sellerId88H P
)88P Q
;88Q R
}99 	
public;; 
async;; 
Task;; 
<;;  
TopSellingProductDto;; .
>;;. /-
!GetTopSellingProductBySellerAsync;;0 Q
(;;Q R
int;;R U
sellerId;;V ^
);;^ _
{<< 	
return== 
await== %
_sellerAnalysisRepository== 2
.==2 3-
!GetTopSellingProductBySellerAsync==3 T
(==T U
sellerId==U ]
)==] ^
;==^ _
}>> 	
}?? 
}@@ çj
_D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\ProductService.cs
	namespace 	
EcomLib
 
. 
Service 
{ 
	namespace 
EcomLib 
. 
Services 
{ 
public 
class 
ProductService #
{ 	
private 
readonly 
IProductRepository /
_productRepository0 B
;B C
public 
ProductService !
(! "
IProductRepository" 4
productRepository5 F
)F G
{ 
_productRepository "
=# $
productRepository% 6
;6 7
} 
public 
async 
Task 
< 
IEnumerable )
<) *

ProductDTO* 4
>4 5
>5 6
GetAllProductsAsync7 J
(J K
)K L
{ 
var 
products 
= 
await $
_productRepository% 7
.7 8
GetAllProductsAsync8 K
(K L
)L M
;M N
return   
products   
.    
Select    &
(  & '
product  ' .
=>  / 1
new  2 5

ProductDTO  6 @
{!! 
	ProductId"" 
="" 
product""  '
.""' (
	ProductId""( 1
,""1 2
ProductName## 
=##  !
product##" )
.##) *
ProductName##* 5
,##5 6
Description$$ 
=$$  !
product$$" )
.$$) *
Description$$* 5
,$$5 6
Price%% 
=%% 
product%% #
.%%# $
Price%%$ )
,%%) *
StockQuantity&& !
=&&" #
product&&$ +
.&&+ ,
StockQuantity&&, 9
,&&9 :
ImageUrl'' 
='' 
product'' &
.''& '
ImageUrl''' /
,''/ 0
	DateAdded(( 
=(( 
product((  '
.((' (
	DateAdded((( 1
,((1 2
IsActive)) 
=)) 
product)) &
.))& '
IsActive))' /
,))/ 0
BrandId** 
=** 
product** %
.**% &
BrandId**& -
,**- .
SellerId++ 
=++ 
product++ &
.++& '
SellerId++' /
,++/ 0
SubCategoryId,, !
=,," #
product,,$ +
.,,+ ,
SubCategoryId,,, 9
}-- 
)-- 
;-- 
}.. 
public// 
async// 
Task// 
<// 
IEnumerable// )
<//) * 
ProductWithSellerDTO//* >
>//> ?
>//? @)
GetAllProductswithSellerAsync//A ^
(//^ _
)//_ `
{00 
var11 
productsWithSellers11 '
=11( )
await11* /
_productRepository110 B
.11B C*
GetAllProductsWithSellersAsync11C a
(11a b
)11b c
;11c d
return22 
productsWithSellers22 *
;22* +
}33 
public66 
async66 
Task66 
<66 

ProductDTO66 (
>66( )
GetProductByIdAsync66* =
(66= >
int66> A
	productId66B K
)66K L
{77 
var88 
product88 
=88 
await88 #
_productRepository88$ 6
.886 7
GetProductByIdAsync887 J
(88J K
	productId88K T
)88T U
;88U V
if99 
(99 
product99 
==99 
null99 #
)99# $
throw:: 
new:: $
ProductNotFoundException:: 6
(::6 7
$str::7 N
)::N O
;::O P
return<< 
new<< 

ProductDTO<< %
{== 
	ProductId>> 
=>> 
product>>  '
.>>' (
	ProductId>>( 1
,>>1 2
ProductName?? 
=??  !
product??" )
.??) *
ProductName??* 5
,??5 6
Description@@ 
=@@  !
product@@" )
.@@) *
Description@@* 5
,@@5 6
PriceAA 
=AA 
productAA #
.AA# $
PriceAA$ )
,AA) *
StockQuantityBB !
=BB" #
productBB$ +
.BB+ ,
StockQuantityBB, 9
,BB9 :
ImageUrlCC 
=CC 
productCC &
.CC& '
ImageUrlCC' /
,CC/ 0
	DateAddedDD 
=DD 
productDD  '
.DD' (
	DateAddedDD( 1
,DD1 2
IsActiveEE 
=EE 
productEE &
.EE& '
IsActiveEE' /
,EE/ 0
BrandIdFF 
=FF 
productFF %
.FF% &
BrandIdFF& -
,FF- .
SellerIdGG 
=GG 
productGG &
.GG& '
SellerIdGG' /
,GG/ 0
SubCategoryIdHH !
=HH" #
productHH$ +
.HH+ ,
SubCategoryIdHH, 9
}II 
;II 
}JJ 
publicLL 
asyncLL 
TaskLL 
<LL 
IEnumerableLL )
<LL) *

ProductDTOLL* 4
>LL4 5
>LL5 6"
GetProductsByNameAsyncLL7 M
(LLM N
stringLLN T
productNameLLU `
)LL` a
{MM 
varNN 
productsNN 
=NN 
awaitNN $
_productRepositoryNN% 7
.NN7 8"
GetProductsByNameAsyncNN8 N
(NNN O
productNameNNO Z
)NNZ [
;NN[ \
ifOO 
(OO 
!OO 
productsOO 
.OO 
AnyOO !
(OO! "
)OO" #
)OO# $
throwPP 
newPP $
ProductNotFoundExceptionPP 6
(PP6 7
productNamePP7 B
)PPB C
;PPC D
returnRR 
productsRR 
.RR  
SelectRR  &
(RR& '
productRR' .
=>RR/ 1
newRR2 5

ProductDTORR6 @
{SS 
	ProductIdTT 
=TT 
productTT  '
.TT' (
	ProductIdTT( 1
,TT1 2
ProductNameUU 
=UU  !
productUU" )
.UU) *
ProductNameUU* 5
,UU5 6
DescriptionVV 
=VV  !
productVV" )
.VV) *
DescriptionVV* 5
,VV5 6
PriceWW 
=WW 
productWW #
.WW# $
PriceWW$ )
,WW) *
StockQuantityXX !
=XX" #
productXX$ +
.XX+ ,
StockQuantityXX, 9
,XX9 :
ImageUrlYY 
=YY 
productYY &
.YY& '
ImageUrlYY' /
,YY/ 0
	DateAddedZZ 
=ZZ 
productZZ  '
.ZZ' (
	DateAddedZZ( 1
,ZZ1 2
IsActive[[ 
=[[ 
product[[ &
.[[& '
IsActive[[' /
,[[/ 0
BrandId\\ 
=\\ 
product\\ %
.\\% &
BrandId\\& -
,\\- .
SellerId]] 
=]] 
product]] &
.]]& '
SellerId]]' /
,]]/ 0
SubCategoryId^^ !
=^^" #
product^^$ +
.^^+ ,
SubCategoryId^^, 9
}`` 
)`` 
;`` 
}aa 
publiccc 
asynccc 
Taskcc 
<cc 
intcc !
>cc! "
AddProductAsynccc# 2
(cc2 3

ProductDTOcc3 =

productDtocc> H
)ccH I
{dd 
varee 
productee 
=ee 
newee !
Productee" )
{ff 
ProductNamegg 
=gg  !

productDtogg" ,
.gg, -
ProductNamegg- 8
,gg8 9
SellerIdhh 
=hh 

productDtohh )
.hh) *
SellerIdhh* 2
,hh2 3
Descriptionii 
=ii  !

productDtoii" ,
.ii, -
Descriptionii- 8
,ii8 9
Pricejj 
=jj 

productDtojj &
.jj& '
Pricejj' ,
,jj, -
StockQuantitykk !
=kk" #

productDtokk$ .
.kk. /
StockQuantitykk/ <
,kk< =
ImageUrlll 
=ll 

productDtoll )
.ll) *
ImageUrlll* 2
,ll2 3
	DateAddedmm 
=mm 

productDtomm  *
.mm* +
	DateAddedmm+ 4
,mm4 5
IsActivenn 
=nn 
truenn #
,nn# $
BrandIdoo 
=oo 

productDtooo (
.oo( )
BrandIdoo) 0
,oo0 1
SubCategoryIdpp !
=pp" #

productDtopp$ .
.pp. /
SubCategoryIdpp/ <
}qq 
;qq 
varss 
	inventoryss 
=ss 
newss  #
	Inventoryss$ -
{tt 
QuantityInStockuu #
=uu$ %

productDtouu& 0
.uu0 1
StockQuantityuu1 >
,uu> ?
ReorderLevelvv  
=vv! "
$numvv# %
,vv% &
LastRestockedDateww %
=ww& '

productDtoww( 2
.ww2 3
	DateAddedww3 <
}xx 
;xx 
intzz 
newProductIdzz  
=zz! "
awaitzz# (
_productRepositoryzz) ;
.zz; <
AddProductAsynczz< K
(zzK L
productzzL S
,zzS T
	inventoryzzU ^
)zz^ _
;zz_ `
return{{ 
newProductId{{ #
;{{# $
}|| 
public~~ 
async~~ 
Task~~ 
UpdateProductAsync~~ 0
(~~0 1

ProductDTO~~1 ;

productDto~~< F
)~~F G
{ 
var
ÄÄ 
product
ÄÄ 
=
ÄÄ 
new
ÄÄ !
Product
ÄÄ" )
{
ÅÅ 
	ProductId
ÇÇ 
=
ÇÇ 

productDto
ÇÇ  *
.
ÇÇ* +
	ProductId
ÇÇ+ 4
,
ÇÇ4 5
SellerId
ÉÉ 
=
ÉÉ 

productDto
ÉÉ (
.
ÉÉ( )
SellerId
ÉÉ) 1
,
ÉÉ1 2
ProductName
ÑÑ 
=
ÑÑ  !

productDto
ÑÑ" ,
.
ÑÑ, -
ProductName
ÑÑ- 8
,
ÑÑ8 9
Description
ÖÖ 
=
ÖÖ  !

productDto
ÖÖ" ,
.
ÖÖ, -
Description
ÖÖ- 8
,
ÖÖ8 9
Price
ÜÜ 
=
ÜÜ 

productDto
ÜÜ &
.
ÜÜ& '
Price
ÜÜ' ,
,
ÜÜ, -
StockQuantity
áá !
=
áá" #

productDto
áá$ .
.
áá. /
StockQuantity
áá/ <
,
áá< =
ImageUrl
àà 
=
àà 

productDto
àà )
.
àà) *
ImageUrl
àà* 2
,
àà2 3
	DateAdded
ââ 
=
ââ 
DateTime
ââ  (
.
ââ( )
Now
ââ) ,
,
ââ, -
IsActive
ää 
=
ää 

productDto
ää )
.
ää) *
IsActive
ää* 2
,
ää2 3
BrandId
ãã 
=
ãã 

productDto
ãã (
.
ãã( )
BrandId
ãã) 0
,
ãã0 1
SubCategoryId
åå !
=
åå" #

productDto
åå$ .
.
åå. /
SubCategoryId
åå/ <
}
çç 
;
çç 
var
èè 
	inventory
èè 
=
èè 
new
èè  #
	Inventory
èè$ -
{
êê 
QuantityInStock
ëë #
=
ëë$ %

productDto
ëë& 0
.
ëë0 1
StockQuantity
ëë1 >
,
ëë> ?
ReorderLevel
íí  
=
íí! "
$num
íí# %
,
íí% &
}
ìì 
;
ìì 
await
ïï  
_productRepository
ïï (
.
ïï( ) 
UpdateProductAsync
ïï) ;
(
ïï; <
product
ïï< C
,
ïïC D
	inventory
ïïE N
)
ïïN O
;
ïïO P
}
ññ 
public
òò 
async
òò 
Task
òò  
DeleteProductAsync
òò 0
(
òò0 1
int
òò1 4
	productId
òò5 >
)
òò> ?
{
ôô 
await
öö  
_productRepository
öö (
.
öö( ) 
DeleteProductAsync
öö) ;
(
öö; <
	productId
öö< E
)
ööE F
;
ööF G
}
õõ 
public
úú 
async
úú 
Task
úú 
<
úú 
IEnumerable
úú )
<
úú) *
SellerProductDTO
úú* :
>
úú: ;
>
úú; <(
GetProductsBySellerIdAsync
úú= W
(
úúW X
int
úúX [
sellerId
úú\ d
)
úúd e
{
ùù 
return
ûû 
await
ûû  
_productRepository
ûû /
.
ûû/ 0(
GetProductsBySellerIdAsync
ûû0 J
(
ûûJ K
sellerId
ûûK S
)
ûûS T
;
ûûT U
}
üü 
public
°° 
async
°° 
Task
°° 
<
°° 
ProductDetailsDTO
°° /
>
°°/ 0#
GetProductDetailsFull
°°1 F
(
°°F G
int
°°G J
	productId
°°K T
)
°°T U
{
¢¢ 
return
££ 
await
££  
_productRepository
££ /
.
££/ 0#
GetProductDetailsFull
££0 E
(
££E F
	productId
££F O
)
££O P
;
££P Q
}
§§ 
}
•• 	
}
¶¶ 
}®® ã
eD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\ProductReviewService.cs
	namespace

 	
EcomLib


 
.

 
Service

 
{ 
public 

class  
ProductReviewService %
{ 
private 
readonly $
IProductReviewRepository 1$
_productReviewRepository2 J
;J K
public  
ProductReviewService #
(# $$
IProductReviewRepository$ <#
productReviewRepository= T
)T U
{ 	$
_productReviewRepository $
=% &#
productReviewRepository' >
;> ?
} 	
public 
Task 
< 
int 
> 
AddReviewAsync '
(' (
	ReviewDTO( 1
	reviewDto2 ;
); <
{ 	
return $
_productReviewRepository +
.+ ,
AddReviewAsync, :
(: ;
	reviewDto; D
)D E
;E F
} 	
public 
Task 
< 
ReviewResponseDTO %
>% &
GetReviewByIdAsync' 9
(9 :
int: =
reviewId> F
)F G
{ 	
return $
_productReviewRepository +
.+ ,
GetReviewByIdAsync, >
(> ?
reviewId? G
)G H
;H I
} 	
public 
Task 
< 
IEnumerable 
<  
ReviewResponseDTO  1
>1 2
>2 3&
GetReviewsByProductIdAsync4 N
(N O
intO R
	productIdS \
)\ ]
{   	
return!! $
_productReviewRepository!! +
.!!+ ,&
GetReviewsByProductIdAsync!!, F
(!!F G
	productId!!G P
)!!P Q
;!!Q R
}"" 	
public$$ 
Task$$ 
<$$ 
IEnumerable$$ 
<$$  
ReviewResponseDTO$$  1
>$$1 2
>$$2 3#
GetReviewsByUserIdAsync$$4 K
($$K L
int$$L O
userId$$P V
)$$V W
{%% 	
return&& $
_productReviewRepository&& +
.&&+ ,#
GetReviewsByUserIdAsync&&, C
(&&C D
userId&&D J
)&&J K
;&&K L
}'' 	
public)) 
Task)) 
<)) 
bool)) 
>)) 
UpdateReviewAsync)) +
())+ ,
int)), /
reviewId))0 8
,))8 9
	ReviewDTO)): C
	reviewDto))D M
)))M N
{** 	
return++ $
_productReviewRepository++ +
.+++ ,
UpdateReviewAsync++, =
(++= >
reviewId++> F
,++F G
	reviewDto++H Q
)++Q R
;++R S
},, 	
public.. 
Task.. 
<.. 
bool.. 
>.. 
DeleteReviewAsync.. +
(..+ ,
int.., /
reviewId..0 8
)..8 9
{// 	
return00 $
_productReviewRepository00 +
.00+ ,
DeleteReviewAsync00, =
(00= >
reviewId00> F
)00F G
;00G H
}11 	
}22 
}44 ò0
gD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\ProductDiscountService.cs
	namespace 	
EcomLib
 
. 
Service 
{ 
public 

class "
ProductDiscountService '
{ 
private 
readonly &
IProductDiscountRepository 3&
_productDiscountRepository4 N
;N O
public "
ProductDiscountService %
(% &&
IProductDiscountRepository& @%
productDiscountRepositoryA Z
)Z [
{ 	&
_productDiscountRepository &
=' (%
productDiscountRepository) B
;B C
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
ProductDiscountDTO& 8
>8 9
>9 :'
GetAllProductDiscountsAsync; V
(V W
)W X
{ 	
var 
productDiscounts  
=! "
await# (&
_productDiscountRepository) C
.C D'
GetAllProductDiscountsAsyncD _
(_ `
)` a
;a b
return 
productDiscounts #
.# $
Select$ *
(* +
pd+ -
=>. 0
new1 4
ProductDiscountDTO5 G
{ 
ProductDiscountId !
=" #
pd$ &
.& '
ProductDiscountId' 8
,8 9
	ProductId 
= 
pd 
. 
	ProductId (
,( )

DiscountId 
= 
pd 
.  

DiscountId  *
} 
) 
; 
}   	
public"" 
async"" 
Task"" 
<"" 
ProductDiscountDTO"" ,
>"", -'
GetProductDiscountByIdAsync"". I
(""I J
int""J M
productDiscountId""N _
)""_ `
{## 	
var$$ 
productDiscount$$ 
=$$  !
await$$" '&
_productDiscountRepository$$( B
.$$B C'
GetProductDiscountByIdAsync$$C ^
($$^ _
productDiscountId$$_ p
)$$p q
;$$q r
if%% 
(%% 
productDiscount%% 
==%%  "
null%%# '
)%%' (
{&& 
throw'' 
new'' ,
 ProductDiscountNotFoundException'' :
('': ;
$str''; W
)''W X
;''X Y
}(( 
return** 
new** 
ProductDiscountDTO** )
{++ 
ProductDiscountId,, !
=,," #
productDiscount,,$ 3
.,,3 4
ProductDiscountId,,4 E
,,,E F
	ProductId-- 
=-- 
productDiscount-- +
.--+ ,
	ProductId--, 5
,--5 6

DiscountId.. 
=.. 
productDiscount.. ,
..., -

DiscountId..- 7
}// 
;// 
}00 	
public22 
async22 
Task22 &
CreateProductDiscountAsync22 4
(224 5
ProductDiscountDTO225 G
productDiscountDTO22H Z
)22Z [
{33 	
var44 
productDiscount44 
=44  !
new44" %
ProductDiscount44& 5
{55 
	ProductId66 
=66 
productDiscountDTO66 .
.66. /
	ProductId66/ 8
,668 9

DiscountId77 
=77 
productDiscountDTO77 /
.77/ 0

DiscountId770 :
}88 
;88 
await:: &
_productDiscountRepository:: ,
.::, -&
CreateProductDiscountAsync::- G
(::G H
productDiscount::H W
)::W X
;::X Y
};; 	
public== 
async== 
Task== &
UpdateProductDiscountAsync== 4
(==4 5
int==5 8
productDiscountId==9 J
,==J K
ProductDiscountDTO==L ^
productDiscountDTO==_ q
)==q r
{>> 	
var?? 
productDiscount?? 
=??  !
await??" '&
_productDiscountRepository??( B
.??B C'
GetProductDiscountByIdAsync??C ^
(??^ _
productDiscountId??_ p
)??p q
;??q r
if@@ 
(@@ 
productDiscount@@ 
==@@  "
null@@# '
)@@' (
{AA 
throwBB 
newBB ,
 ProductDiscountNotFoundExceptionBB :
(BB: ;
$strBB; W
)BBW X
;BBX Y
}CC 
productDiscountEE 
.EE 
	ProductIdEE %
=EE& '
productDiscountDTOEE( :
.EE: ;
	ProductIdEE; D
;EED E
productDiscountFF 
.FF 

DiscountIdFF &
=FF' (
productDiscountDTOFF) ;
.FF; <

DiscountIdFF< F
;FFF G
awaitHH &
_productDiscountRepositoryHH ,
.HH, -&
UpdateProductDiscountAsyncHH- G
(HHG H
productDiscountHHH W
)HHW X
;HHX Y
}II 	
publicKK 
asyncKK 
TaskKK &
DeleteProductDiscountAsyncKK 4
(KK4 5
intKK5 8
productDiscountIdKK9 J
)KKJ K
{LL 	
varMM 
productDiscountMM 
=MM  !
awaitMM" '&
_productDiscountRepositoryMM( B
.MMB C'
GetProductDiscountByIdAsyncMMC ^
(MM^ _
productDiscountIdMM_ p
)MMp q
;MMq r
ifNN 
(NN 
productDiscountNN 
==NN  "
nullNN# '
)NN' (
{OO 
throwPP 
newPP ,
 ProductDiscountNotFoundExceptionPP :
(PP: ;
$strPP; W
)PPW X
;PPX Y
}QQ 
awaitSS &
_productDiscountRepositorySS ,
.SS, -&
DeleteProductDiscountAsyncSS- G
(SSG H
productDiscountIdSSH Y
)SSY Z
;SSZ [
}TT 	
}UU 
}XX ∫h
]D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\OrderService.cs
	namespace 	
EcomLib
 
. 
Service 
{ 
public 

class 
OrderService 
{ 
private 
readonly 
IOrderRepository )
_orderRepository* :
;: ;
private 
readonly  
IOrderItemRepository - 
_orderItemRepository. B
;B C
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
private 
readonly 
IPaymentRepository +
_paymentRepository, >
;> ?
public 
OrderService 
( 
IOrderRepository ,
orderRepository- <
,< = 
IOrderItemRepository> R
orderItemRepositoryS f
,f g
IProductRepositoryh z
productRepository	{ å
,
å ç 
IPaymentRepository
é †
paymentRepository
° ≤
)
≤ ≥
{ 	
_orderRepository 
= 
orderRepository .
;. / 
_orderItemRepository  
=! "
orderItemRepository# 6
;6 7
_productRepository 
=  
productRepository! 2
;2 3
_paymentRepository 
=  
paymentRepository! 2
;2 3
} 	
public 
async 
Task 
< !
PlaceOrderResponseDto /
>/ 0
PlaceOrderAsync1 @
(@ A
PlaceOrderDtoA N
orderDtoO W
)W X
{ 	
var!! 
order!! 
=!! 
new!! 
Order!! !
{"" 
UserId## 
=## 
orderDto## !
.##! "
UserId##" (
,##( )
	OrderDate$$ 
=$$ 
orderDto$$ $
.$$$ %
	OrderDate$$% .
,$$. /
TotalAmount%% 
=%% 
orderDto%% &
.%%& '
TotalAmount%%' 2
,%%2 3
ShippingAddressId&& !
=&&" #
orderDto&&$ ,
.&&, -
ShippingAddressId&&- >
,&&> ?
BillingAddressId''  
=''! "
orderDto''# +
.''+ ,
BillingAddressId'', <
,''< =
OrderStatus(( 
=(( 
orderDto(( &
.((& '
OrderStatus((' 2
,((2 3

OrderItems)) 
=)) 
new))  
List))! %
<))% &
	OrderItem))& /
>))/ 0
())0 1
)))1 2
}** 
;** 
foreach-- 
(-- 
var-- 
itemDto--  
in--! #
orderDto--$ ,
.--, -

OrderItems--- 7
)--7 8
{.. 
var// 
product// 
=// 
await// #
_productRepository//$ 6
.//6 7
GetProductByIdAsync//7 J
(//J K
itemDto//K R
.//R S
	ProductId//S \
)//\ ]
;//] ^
if00 
(00 
product00 
==00 
null00 #
)00# $
{11 
throw22 
new22 
	Exception22 '
(22' (
$"22( *
$str22* :
{22: ;
itemDto22; B
.22B C
	ProductId22C L
}22L M
$str22M X
"22X Y
)22Y Z
;22Z [
}33 
var44 
	orderItem44 
=44 
new44  #
	OrderItem44$ -
{55 
	ProductId66 
=66 
itemDto66  '
.66' (
	ProductId66( 1
,661 2
SellerId77 
=77 
product77 &
.77& '
SellerId77' /
,77/ 0
Quantity88 
=88 
itemDto88 &
.88& '
Quantity88' /
,88/ 0
	UnitPrice99 
=99 
itemDto99  '
.99' (
	UnitPrice99( 1
,991 2

TotalPrice:: 
=::  
itemDto::! (
.::( )

TotalPrice::) 3
,::3 4

ItemStatus;; 
=;;  
itemDto;;! (
.;;( )

ItemStatus;;) 3
}<< 
;<< 
order>> 
.>> 

OrderItems>>  
.>>  !
Add>>! $
(>>$ %
	orderItem>>% .
)>>. /
;>>/ 0
await?? 
_productRepository?? (
.??( )&
UpdateProductQuantityAsync??) C
(??C D
	orderItem??D M
.??M N
	ProductId??N W
,??W X
-??Y Z
	orderItem??Z c
.??c d
Quantity??d l
)??l m
;??m n
}@@ 
varCC 
newOrderCC 
=CC 
awaitCC  
_orderRepositoryCC! 1
.CC1 2
AddOrderAsyncCC2 ?
(CC? @
orderCC@ E
)CCE F
;CCF G
foreachFF 
(FF 
varFF 

paymentDtoFF #
inFF$ &
orderDtoFF' /
.FF/ 0
PaymentsFF0 8
)FF8 9
{GG 
varHH 
paymentHH 
=HH 
newHH !
PaymentHH" )
{II 
OrderIdJJ 
=JJ 
newOrderJJ &
.JJ& '
OrderIdJJ' .
,JJ. /
PaymentDateKK 
=KK  !

paymentDtoKK" ,
.KK, -
PaymentDateKK- 8
,KK8 9
PaymentAmountLL !
=LL" #

paymentDtoLL$ .
.LL. /
PaymentAmountLL/ <
,LL< =
PaymentMethodMM !
=MM" #

paymentDtoMM$ .
.MM. /
PaymentMethodMM/ <
,MM< =
PaymentStatusNN !
=NN" #

paymentDtoNN$ .
.NN. /
PaymentStatusNN/ <
}OO 
;OO 
awaitQQ 
_paymentRepositoryQQ (
.QQ( )
AddPaymentAsyncQQ) 8
(QQ8 9
paymentQQ9 @
)QQ@ A
;QQA B
}RR 
varUU 
responseUU 
=UU 
newUU !
PlaceOrderResponseDtoUU 4
{VV 
OrderIdWW 
=WW 
newOrderWW "
.WW" #
OrderIdWW# *
,WW* +
TotalAmountXX 
=XX 
newOrderXX &
.XX& '
TotalAmountXX' 2
,XX2 3
	OrderDateYY 
=YY 
newOrderYY $
.YY$ %
	OrderDateYY% .
,YY. /
OrderStatusZZ 
=ZZ 
newOrderZZ &
.ZZ& '
OrderStatusZZ' 2
,ZZ2 3

OrderItems[[ 
=[[ 
newOrder[[ %
.[[% &

OrderItems[[& 0
.[[0 1
Select[[1 7
([[7 8
oi[[8 :
=>[[; =
new[[> A 
OrderItemResponseDto[[B V
{\\ 
	ProductId]] 
=]] 
oi]]  "
.]]" #
	ProductId]]# ,
,]], -
SellerId^^ 
=^^ 
oi^^ !
.^^! "
SellerId^^" *
,^^* +
Quantity__ 
=__ 
oi__ !
.__! "
Quantity__" *
,__* +
	UnitPrice`` 
=`` 
oi``  "
.``" #
	UnitPrice``# ,
,``, -

TotalPriceaa 
=aa  
oiaa! #
.aa# $

TotalPriceaa$ .
,aa. /

ItemStatusbb 
=bb  
oibb! #
.bb# $

ItemStatusbb$ .
}cc 
)cc 
.cc 
ToListcc 
(cc 
)cc 
,cc 
Paymentsdd 
=dd 
orderDtodd #
.dd# $
Paymentsdd$ ,
.dd, -
Selectdd- 3
(dd3 4
pdd4 5
=>dd6 8
newdd9 <
PaymentResponseDtodd= O
{ee 
PaymentDateff 
=ff  !
pff" #
.ff# $
PaymentDateff$ /
,ff/ 0
PaymentAmountgg !
=gg" #
pgg$ %
.gg% &
PaymentAmountgg& 3
,gg3 4
PaymentMethodhh !
=hh" #
phh$ %
.hh% &
PaymentMethodhh& 3
,hh3 4
PaymentStatusii !
=ii" #
pii$ %
.ii% &
PaymentStatusii& 3
}jj 
)jj 
.jj 
ToListjj 
(jj 
)jj 
}kk 
;kk 
returnmm 
responsemm 
;mm 
}nn 	
publicqq 
asyncqq 
Taskqq &
UpdateOrderItemStatusAsyncqq 4
(qq4 5
intqq5 8
orderItemIdqq9 D
,qqD E
OrderItemStatusqqF U
statusqqV \
)qq\ ]
{rr 	
awaitss  
_orderItemRepositoryss &
.ss& '&
UpdateOrderItemStatusAsyncss' A
(ssA B
orderItemIdssB M
,ssM N
statusssO U
)ssU V
;ssV W
varvv 
	orderItemvv 
=vv 
awaitvv ! 
_orderItemRepositoryvv" 6
.vv6 7!
GetOrderItemByIdAsyncvv7 L
(vvL M
orderItemIdvvM X
)vvX Y
;vvY Z
varww 
orderIdww 
=ww 
	orderItemww #
.ww# $
OrderIdww$ +
;ww+ ,
varzz 

orderItemszz 
=zz 
awaitzz " 
_orderItemRepositoryzz# 7
.zz7 8'
GetOrderItemsByOrderIdAsynczz8 S
(zzS T
orderIdzzT [
)zz[ \
;zz\ ]
if{{ 
({{ 

orderItems{{ 
.{{ 
All{{ 
({{ 
oi{{ !
=>{{" $
oi{{% '
.{{' (

ItemStatus{{( 2
=={{3 5
OrderItemStatus{{6 E
.{{E F
Shipped{{F M
){{M N
){{N O
{|| 
await}} 
_orderRepository}} &
.}}& '"
UpdateOrderStatusAsync}}' =
(}}= >
orderId}}> E
,}}E F
OrderStatus}}G R
.}}R S
Shipped}}S Z
)}}Z [
;}}[ \
}~~ 
if
ÅÅ 
(
ÅÅ 

orderItems
ÅÅ 
.
ÅÅ 
All
ÅÅ 
(
ÅÅ 
oi
ÅÅ !
=>
ÅÅ" $
oi
ÅÅ% '
.
ÅÅ' (

ItemStatus
ÅÅ( 2
==
ÅÅ3 5
OrderItemStatus
ÅÅ6 E
.
ÅÅE F
	Delivered
ÅÅF O
)
ÅÅO P
)
ÅÅP Q
{
ÇÇ 
await
ÉÉ 
_orderRepository
ÉÉ &
.
ÉÉ& '$
UpdateOrderStatusAsync
ÉÉ' =
(
ÉÉ= >
orderId
ÉÉ> E
,
ÉÉE F
OrderStatus
ÉÉG R
.
ÉÉR S
	Delivered
ÉÉS \
)
ÉÉ\ ]
;
ÉÉ] ^
}
ÑÑ 
}
ÖÖ 	
public
áá 
async
áá 
Task
áá 
<
áá 
IEnumerable
áá %
<
áá% &
AdminOrderDTO
áá& 3
>
áá3 4
>
áá4 5
GetAllOrdersAsync
áá6 G
(
ááG H
)
ááH I
{
àà 	
return
ââ 
await
ââ 
_orderRepository
ââ )
.
ââ) *
GetAllOrdersAsync
ââ* ;
(
ââ; <
)
ââ< =
;
ââ= >
}
ää 	
public
ãã 
async
ãã 
Task
ãã 
<
ãã 
IEnumerable
ãã %
<
ãã% & 
SellerOrderItemDTO
ãã& 8
>
ãã8 9
>
ãã9 :(
GetOrderItemsBySellerAsync
ãã; U
(
ããU V
int
ããV Y
sellerId
ããZ b
)
ããb c
{
åå 	
return
çç 
await
çç "
_orderItemRepository
çç -
.
çç- .*
GetOrderItemsBySellerIdAsync
çç. J
(
ççJ K
sellerId
ççK S
)
ççS T
;
ççT U
}
éé 	
public
êê 
async
êê 
Task
êê 
<
êê 
decimal
êê !
>
êê! ""
GetTotalRevenueAsync
êê# 7
(
êê7 8
)
êê8 9
{
ëë 	
return
íí 
await
íí 
_orderRepository
íí )
.
íí) *"
GetTotalRevenueAsync
íí* >
(
íí> ?
)
íí? @
;
íí@ A
}
ìì 	
public
ññ 
async
ññ 
Task
ññ 
<
ññ 
decimal
ññ !
>
ññ! "*
GetTotalRevenueBySellerAsync
ññ# ?
(
ññ? @
int
ññ@ C
sellerId
ññD L
)
ññL M
{
óó 	
return
òò 
await
òò "
_orderItemRepository
òò -
.
òò- .*
GetTotalRevenueBySellerAsync
òò. J
(
òòJ K
sellerId
òòK S
)
òòS T
;
òòT U
}
ôô 	
public
öö 
async
öö 
Task
öö 
<
öö 
List
öö 
<
öö 
OrderItemuserDTO
öö /
>
öö/ 0
>
öö0 1&
GetUserOrderHistoryAsync
öö2 J
(
ööJ K
int
ööK N
userId
ööO U
)
ööU V
{
õõ 	
return
úú 
await
úú "
_orderItemRepository
úú -
.
úú- .(
GetOrderItemsByUserIdAsync
úú. H
(
úúH I
userId
úúI O
)
úúO P
;
úúP Q
}
ùù 	
}
ûû 
}üü Î"
aD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\InventoryService.cs
	namespace

 	
EcomLib


 
.

 
Service

 
{ 
public 

class 
InventoryService !
{ 
private 
readonly  
IInventoryRepository - 
_inventoryRepository. B
;B C
public 
InventoryService 
(   
IInventoryRepository  4
inventoryRepository5 H
)H I
{ 	 
_inventoryRepository  
=! "
inventoryRepository# 6
;6 7
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
InventoryDTO& 2
>2 3
>3 4"
GetAllInventoriesAsync5 K
(K L
)L M
{ 	
var 
inventories 
= 
await # 
_inventoryRepository$ 8
.8 9"
GetAllInventoriesAsync9 O
(O P
)P Q
;Q R
return 
inventories 
. 
Select %
(% &
i& '
=>( *
MapToInventoryDTO+ <
(< =
i= >
)> ?
)? @
;@ A
} 	
public 
async 
Task 
< 
InventoryDTO &
>& '!
GetInventoryByIdAsync( =
(= >
int> A
inventoryIdB M
)M N
{ 	
var 
	inventory 
= 
await ! 
_inventoryRepository" 6
.6 7!
GetInventoryByIdAsync7 L
(L M
inventoryIdM X
)X Y
;Y Z
return 
MapToInventoryDTO $
($ %
	inventory% .
). /
;/ 0
} 	
public!! 
async!! 
Task!! 
<!! 
IEnumerable!! %
<!!% &
InventoryDTO!!& 2
>!!2 3
>!!3 4*
GetInventoriesByProductIdAsync!!5 S
(!!S T
int!!T W
	productId!!X a
)!!a b
{"" 	
var## 
inventories## 
=## 
await## # 
_inventoryRepository##$ 8
.##8 9*
GetInventoriesByProductIdAsync##9 W
(##W X
	productId##X a
)##a b
;##b c
return$$ 
inventories$$ 
.$$ 
Select$$ %
($$% &
i$$& '
=>$$( *
MapToInventoryDTO$$+ <
($$< =
i$$= >
)$$> ?
)$$? @
;$$@ A
}%% 	
public'' 
async'' 
Task'' 
<'' 
IEnumerable'' %
<''% &
InventoryDTO''& 2
>''2 3
>''3 4,
 GetInventoriesByProductNameAsync''5 U
(''U V
string''V \
productName''] h
)''h i
{(( 	
var)) 
inventories)) 
=)) 
await)) # 
_inventoryRepository))$ 8
.))8 9,
 GetInventoriesByProductNameAsync))9 Y
())Y Z
productName))Z e
)))e f
;))f g
return** 
inventories** 
.** 
Select** %
(**% &
i**& '
=>**( *
MapToInventoryDTO**+ <
(**< =
i**= >
)**> ?
)**? @
;**@ A
}++ 	
private.. 
InventoryDTO.. 
MapToInventoryDTO.. .
(... /
	Inventory../ 8
	inventory..9 B
)..B C
{// 	
return00 
new00 
InventoryDTO00 #
{11 
InventoryId22 
=22 
	inventory22 '
.22' (
InventoryId22( 3
,223 4
	ProductId33 
=33 
	inventory33 %
.33% &
	ProductId33& /
,33/ 0
QuantityInStock44 
=44  !
	inventory44" +
.44+ ,
QuantityInStock44, ;
,44; <
ReorderLevel55 
=55 
	inventory55 (
.55( )
ReorderLevel55) 5
,555 6
LastRestockedDate66 !
=66" #
	inventory66$ -
.66- .
LastRestockedDate66. ?
}77 
;77 
}88 	
}99 
};; ‹
]D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\EmailService.cs
	namespace

 	
EcomLib


 
.

 
Service

 
{ 
public 

class 
EmailService 
{ 
private 
readonly 
MailSettings %
_mailSettings& 3
;3 4
public 
EmailService 
( 
IOptions $
<$ %
MailSettings% 1
>1 2
mailSettings3 ?
)? @
{ 	
_mailSettings 
= 
mailSettings (
.( )
Value) .
;. /
} 	
public 
async 
Task 
SendEmailAsync (
(( )
string) /
toEmail0 7
,7 8
string9 ?
subject@ G
,G H
stringI O
messageBodyP [
)[ \
{ 	
var 
mailMessage 
= 
new !
MailMessage" -
{ 
From 
= 
new 
MailAddress &
(& '
_mailSettings' 4
.4 5
SmtpUser5 =
,= >
$str? K
)K L
,L M
Subject 
= 
subject !
,! "
Body 
= 
messageBody "
," #

IsBodyHtml 
= 
true !
} 
; 
mailMessage 
. 
To 
. 
Add 
( 
toEmail &
)& '
;' (
using 
var 

smtpClient  
=! "
new# &

SmtpClient' 1
(1 2
_mailSettings2 ?
.? @

SmtpServer@ J
,J K
_mailSettingsL Y
.Y Z
SmtpPortZ b
)b c
{   
Credentials!! 
=!! 
new!! !
NetworkCredential!!" 3
(!!3 4
_mailSettings!!4 A
.!!A B
SmtpUser!!B J
,!!J K
_mailSettings!!L Y
.!!Y Z
SmtpPass!!Z b
)!!b c
,!!c d
	EnableSsl"" 
="" 
true""  
}## 
;## 
await%% 

smtpClient%% 
.%% 
SendMailAsync%% *
(%%* +
mailMessage%%+ 6
)%%6 7
;%%7 8
}&& 	
}'' 
public(( 

class(( 
MailSettings(( 
{)) 
public** 
string** 

SmtpServer**  
{**! "
get**# &
;**& '
set**( +
;**+ ,
}**- .
public++ 
int++ 
SmtpPort++ 
{++ 
get++ !
;++! "
set++# &
;++& '
}++( )
public,, 
string,, 
SmtpUser,, 
{,,  
get,,! $
;,,$ %
set,,& )
;,,) *
},,+ ,
public-- 
string-- 
SmtpPass-- 
{--  
get--! $
;--$ %
set--& )
;--) *
}--+ ,
}.. 
}// úN
`D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\DiscountService.cs
	namespace 	
EcomLib
 
. 
Service 
{ 
public 

class 
DiscountService  
{ 
private 
readonly 
IDiscountRepository ,
_discountRepository- @
;@ A
public 
DiscountService 
( 
IDiscountRepository 2
discountRepository3 E
)E F
{ 	
_discountRepository 
=  !
discountRepository" 4
;4 5
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
DiscountDTO& 1
>1 2
>2 3 
GetAllDiscountsAsync4 H
(H I
)I J
{ 	
var 
	discounts 
= 
await !
_discountRepository" 5
.5 6 
GetAllDiscountsAsync6 J
(J K
)K L
;L M
return 
	discounts 
. 
Select #
(# $
d$ %
=>& (
new) ,
DiscountDTO- 8
{ 

DiscountId 
= 
d 
. 

DiscountId )
,) *
DiscountCode 
= 
d  
.  !
DiscountCode! -
,- .
Description 
= 
d 
.  
Description  +
,+ ,
DiscountType 
= 
d  
.  !
DiscountType! -
,- .
DiscountValue   
=   
d    !
.  ! "
DiscountValue  " /
,  / 0
	StartDate!! 
=!! 
d!! 
.!! 
	StartDate!! '
,!!' (
EndDate"" 
="" 
d"" 
."" 
EndDate"" #
,""# $
IsActive## 
=## 
d## 
.## 
IsActive## %
}$$ 
)$$ 
;$$ 
}%% 	
public'' 
async'' 
Task'' 
<'' 
DiscountDTO'' %
>''% & 
GetDiscountByIdAsync''' ;
(''; <
int''< ?

discountId''@ J
)''J K
{(( 	
var)) 
discount)) 
=)) 
await))  
_discountRepository))! 4
.))4 5 
GetDiscountByIdAsync))5 I
())I J

discountId))J T
)))T U
;))U V
if** 
(** 
discount** 
==** 
null**  
)**  !
{++ 
throw,, 
new,, %
DiscountNotFoundException,, 3
(,,3 4
$str,,4 H
),,H I
;,,I J
}-- 
return// 
new// 
DiscountDTO// "
{00 

DiscountId11 
=11 
discount11 %
.11% &

DiscountId11& 0
,110 1
DiscountCode22 
=22 
discount22 '
.22' (
DiscountCode22( 4
,224 5
Description33 
=33 
discount33 &
.33& '
Description33' 2
,332 3
DiscountType44 
=44 
discount44 '
.44' (
DiscountType44( 4
,444 5
DiscountValue55 
=55 
discount55  (
.55( )
DiscountValue55) 6
,556 7
	StartDate66 
=66 
discount66 $
.66$ %
	StartDate66% .
,66. /
EndDate77 
=77 
discount77 "
.77" #
EndDate77# *
,77* +
IsActive88 
=88 
discount88 #
.88# $
IsActive88$ ,
}99 
;99 
}:: 	
public<< 
async<< 
Task<< 
<<< 
DiscountDTO<< %
><<% &"
GetDiscountByCodeAsync<<' =
(<<= >
string<<> D
discountCode<<E Q
)<<Q R
{== 	
var>> 
discount>> 
=>> 
await>>  
_discountRepository>>! 4
.>>4 5"
GetDiscountByCodeAsync>>5 K
(>>K L
discountCode>>L X
)>>X Y
;>>Y Z
if@@ 
(@@ 
discount@@ 
==@@ 
null@@  
)@@  !
{AA 
returnBB 
nullBB 
;BB 
}CC 
varFF 
discountDTOFF 
=FF 
newFF !
DiscountDTOFF" -
{GG 

DiscountIdHH 
=HH 
discountHH %
.HH% &

DiscountIdHH& 0
,HH0 1
DiscountCodeII 
=II 
discountII '
.II' (
DiscountCodeII( 4
,II4 5
DescriptionJJ 
=JJ 
discountJJ &
.JJ& '
DescriptionJJ' 2
,JJ2 3
DiscountTypeKK 
=KK 
discountKK '
.KK' (
DiscountTypeKK( 4
,KK4 5
DiscountValueLL 
=LL 
discountLL  (
.LL( )
DiscountValueLL) 6
,LL6 7
	StartDateMM 
=MM 
discountMM $
.MM$ %
	StartDateMM% .
,MM. /
EndDateNN 
=NN 
discountNN "
.NN" #
EndDateNN# *
,NN* +
IsActiveOO 
=OO 
discountOO #
.OO# $
IsActiveOO$ ,
}PP 
;PP 
returnRR 
discountDTORR 
;RR 
}SS 	
publicUU 
asyncUU 
TaskUU 
CreateDiscountAsyncUU -
(UU- .
DiscountDTOUU. 9
discountDTOUU: E
)UUE F
{VV 	
varWW 
discountWW 
=WW 
newWW 
DiscountWW '
{XX 
DiscountCodeYY 
=YY 
discountDTOYY *
.YY* +
DiscountCodeYY+ 7
,YY7 8
DescriptionZZ 
=ZZ 
discountDTOZZ )
.ZZ) *
DescriptionZZ* 5
,ZZ5 6
DiscountType[[ 
=[[ 
discountDTO[[ *
.[[* +
DiscountType[[+ 7
,[[7 8
DiscountValue\\ 
=\\ 
discountDTO\\  +
.\\+ ,
DiscountValue\\, 9
,\\9 :
	StartDate]] 
=]] 
discountDTO]] '
.]]' (
	StartDate]]( 1
,]]1 2
EndDate^^ 
=^^ 
discountDTO^^ %
.^^% &
EndDate^^& -
,^^- .
IsActive__ 
=__ 
discountDTO__ &
.__& '
IsActive__' /
}`` 
;`` 
awaitbb 
_discountRepositorybb %
.bb% &
CreateDiscountAsyncbb& 9
(bb9 :
discountbb: B
)bbB C
;bbC D
}cc 	
publicee 
asyncee 
Taskee 
UpdateDiscountAsyncee -
(ee- .
intee. 1

discountIdee2 <
,ee< =
DiscountDTOee> I
discountDTOeeJ U
)eeU V
{ff 	
vargg 
discountgg 
=gg 
awaitgg  
_discountRepositorygg! 4
.gg4 5 
GetDiscountByIdAsyncgg5 I
(ggI J

discountIdggJ T
)ggT U
;ggU V
ifhh 
(hh 
discounthh 
==hh 
nullhh  
)hh  !
{ii 
throwjj 
newjj %
DiscountNotFoundExceptionjj 3
(jj3 4
$strjj4 H
)jjH I
;jjI J
}kk 
discountmm 
.mm 
DiscountCodemm !
=mm" #
discountDTOmm$ /
.mm/ 0
DiscountCodemm0 <
;mm< =
discountnn 
.nn 
Descriptionnn  
=nn! "
discountDTOnn# .
.nn. /
Descriptionnn/ :
;nn: ;
discountoo 
.oo 
DiscountTypeoo !
=oo" #
discountDTOoo$ /
.oo/ 0
DiscountTypeoo0 <
;oo< =
discountpp 
.pp 
DiscountValuepp "
=pp# $
discountDTOpp% 0
.pp0 1
DiscountValuepp1 >
;pp> ?
discountqq 
.qq 
	StartDateqq 
=qq  
discountDTOqq! ,
.qq, -
	StartDateqq- 6
;qq6 7
discountrr 
.rr 
EndDaterr 
=rr 
discountDTOrr *
.rr* +
EndDaterr+ 2
;rr2 3
discountss 
.ss 
IsActivess 
=ss 
discountDTOss  +
.ss+ ,
IsActivess, 4
;ss4 5
awaituu 
_discountRepositoryuu %
.uu% &
UpdateDiscountAsyncuu& 9
(uu9 :

discountIduu: D
,uuD E
discountuuF N
)uuN O
;uuO P
}vv 	
publicxx 
asyncxx 
Taskxx 
DeleteDiscountAsyncxx -
(xx- .
intxx. 1

discountIdxx2 <
)xx< =
{yy 	
varzz 
discountzz 
=zz 
awaitzz  
_discountRepositoryzz! 4
.zz4 5 
GetDiscountByIdAsynczz5 I
(zzI J

discountIdzzJ T
)zzT U
;zzU V
if{{ 
({{ 
discount{{ 
=={{ 
null{{  
){{  !
{|| 
throw}} 
new}} %
DiscountNotFoundException}} 3
(}}3 4
$str}}4 H
)}}H I
;}}I J
}~~ 
await
ÄÄ !
_discountRepository
ÄÄ %
.
ÄÄ% &!
DeleteDiscountAsync
ÄÄ& 9
(
ÄÄ9 :

discountId
ÄÄ: D
)
ÄÄD E
;
ÄÄE F
}
ÅÅ 	
}
ÇÇ 
}ÑÑ ˇ?
`D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\CategoryService.cs
public 
class 
CategoryService 
{ 
private 
readonly 
ICategoryRepository (
_categoryRepository) <
;< =
public 

CategoryService 
( 
ICategoryRepository .
categoryRepository/ A
)A B
{		 
_categoryRepository

 
=

 
categoryRepository

 0
;

0 1
} 
public 

async 
Task 
< 
int 
> "
AddParentCategoryAsync 1
(1 2
ParentCategoryDTO2 C
parentCategoryDTOD U
)U V
{ 
return 
await 
_categoryRepository (
.( )"
AddParentCategoryAsync) ?
(? @
parentCategoryDTO@ Q
)Q R
;R S
} 
public 

async 
Task 
< 
ParentCategoryDTO '
>' (&
GetParentCategoryByIdAsync) C
(C D
intD G
parentCategoryIdH X
)X Y
{ 
return 
await 
_categoryRepository (
.( )&
GetParentCategoryByIdAsync) C
(C D
parentCategoryIdD T
)T U
;U V
} 
public 

async 
Task 
< 
IEnumerable !
<! "
ParentCategoryDTO" 3
>3 4
>4 5'
GetAllParentCategoriesAsync6 Q
(Q R
)R S
{ 
return 
await 
_categoryRepository (
.( )'
GetAllParentCategoriesAsync) D
(D E
)E F
;F G
} 
public 

async 
Task 
< 
ParentCategoryDTO '
>' (%
UpdateParentCategoryAsync) B
(B C
ParentCategoryDTOC T
parentCategoryDTOU f
)f g
{ 
return 
await 
_categoryRepository (
.( )%
UpdateParentCategoryAsync) B
(B C
parentCategoryDTOC T
)T U
;U V
}   
public"" 

async"" 
Task"" 
<"" 
bool"" 
>"" %
DeleteParentCategoryAsync"" 5
(""5 6
int""6 9
parentCategoryId"": J
)""J K
{## 
return$$ 
await$$ 
_categoryRepository$$ (
.$$( )%
DeleteParentCategoryAsync$$) B
($$B C
parentCategoryId$$C S
)$$S T
;$$T U
}%% 
public(( 

async(( 
Task(( 
<(( 
int(( 
>(( 
AddSubCategoryAsync(( .
(((. /
SubCategoryDTO((/ =
subCategoryDTO((> L
)((L M
{)) 
return** 
await** 
_categoryRepository** (
.**( )
AddSubCategoryAsync**) <
(**< =
subCategoryDTO**= K
)**K L
;**L M
}++ 
public-- 

async-- 
Task-- 
<-- 
SubCategoryDTO-- $
>--$ %#
GetSubCategoryByIdAsync--& =
(--= >
int--> A
subCategoryId--B O
)--O P
{.. 
return// 
await// 
_categoryRepository// (
.//( )#
GetSubCategoryByIdAsync//) @
(//@ A
subCategoryId//A N
)//N O
;//O P
}00 
public22 

async22 
Task22 
<22 
IEnumerable22 !
<22! "
SubCategoryDTO22" 0
>220 1
>221 2$
GetAllSubCategoriesAsync223 K
(22K L
)22L M
{33 
return44 
await44 
_categoryRepository44 (
.44( )$
GetAllSubCategoriesAsync44) A
(44A B
)44B C
;44C D
}55 
public77 

async77 
Task77 
<77 
IEnumerable77 !
<77! "
SubCategoryDTO77" 0
>770 1
>771 2+
GetSubCategoriesByParentIdAsync773 R
(77R S
int77S V
parentCategoryId77W g
)77g h
{88 
return99 
await99 
_categoryRepository99 (
.99( )+
GetSubCategoriesByParentIdAsync99) H
(99H I
parentCategoryId99I Y
)99Y Z
;99Z [
}:: 
public<< 

async<< 
Task<< 
<<< 
SubCategoryDTO<< $
><<$ %"
UpdateSubCategoryAsync<<& <
(<<< =
SubCategoryDTO<<= K
subCategoryDTO<<L Z
)<<Z [
{== 
return>> 
await>> 
_categoryRepository>> (
.>>( )"
UpdateSubCategoryAsync>>) ?
(>>? @
subCategoryDTO>>@ N
)>>N O
;>>O P
}?? 
publicAA 

asyncAA 
TaskAA 
<AA 
boolAA 
>AA "
DeleteSubCategoryAsyncAA 2
(AA2 3
intAA3 6
subCategoryIdAA7 D
)AAD E
{BB 
returnCC 
awaitCC 
_categoryRepositoryCC (
.CC( )"
DeleteSubCategoryAsyncCC) ?
(CC? @
subCategoryIdCC@ M
)CCM N
;CCN O
}DD 
publicGG 

asyncGG 
TaskGG 
<GG 
intGG 
>GG 
AddBrandAsyncGG (
(GG( )
BrandDTOGG) 1
brandDTOGG2 :
)GG: ;
{HH 
returnII 
awaitII 
_categoryRepositoryII (
.II( )
AddBrandAsyncII) 6
(II6 7
brandDTOII7 ?
)II? @
;II@ A
}JJ 
publicLL 

asyncLL 
TaskLL 
<LL 
BrandDTOLL 
>LL 
GetBrandByIdAsyncLL  1
(LL1 2
intLL2 5
brandIdLL6 =
)LL= >
{MM 
returnNN 
awaitNN 
_categoryRepositoryNN (
.NN( )
GetBrandByIdAsyncNN) :
(NN: ;
brandIdNN; B
)NNB C
;NNC D
}OO 
publicQQ 

asyncQQ 
TaskQQ 
<QQ 
IEnumerableQQ !
<QQ! "
BrandDTOQQ" *
>QQ* +
>QQ+ ,
GetAllBrandsAsyncQQ- >
(QQ> ?
)QQ? @
{RR 
returnSS 
awaitSS 
_categoryRepositorySS (
.SS( )
GetAllBrandsAsyncSS) :
(SS: ;
)SS; <
;SS< =
}TT 
publicVV 

asyncVV 
TaskVV 
<VV 
BrandDTOVV 
>VV 
GetBrandByNameAsyncVV  3
(VV3 4
stringVV4 :
	brandNameVV; D
)VVD E
{WW 
returnXX 
awaitXX 
_categoryRepositoryXX (
.XX( )
GetBrandByNameAsyncXX) <
(XX< =
	brandNameXX= F
)XXF G
;XXG H
}YY 
public[[ 

async[[ 
Task[[ 
<[[ 
BrandDTO[[ 
>[[ 
UpdateBrandAsync[[  0
([[0 1
BrandDTO[[1 9
brandDTO[[: B
)[[B C
{\\ 
return]] 
await]] 
_categoryRepository]] (
.]]( )
UpdateBrandAsync]]) 9
(]]9 :
brandDTO]]: B
)]]B C
;]]C D
}^^ 
public`` 

async`` 
Task`` 
<`` 
bool`` 
>`` 
DeleteBrandAsync`` ,
(``, -
int``- 0
brandId``1 8
)``8 9
{aa 
returnbb 
awaitbb 
_categoryRepositorybb (
.bb( )
DeleteBrandAsyncbb) 9
(bb9 :
brandIdbb: A
)bbA B
;bbB C
}cc 
}ff ¡K
\D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\CartService.cs
	namespace

 	
EcomLib


 
.

 
Service

 
{ 
public 

class 
CartService 
{ 
private 
readonly 
ICartRepository (
_cartRepository) 8
;8 9
public 
CartService 
( 
ICartRepository *
cartRepository+ 9
)9 :
{ 	
_cartRepository 
= 
cartRepository ,
;, -
} 	
public 
CartDTO 
GetCartByUserId &
(& '
int' *
userId+ 1
)1 2
{ 	
var 
cart 
= 
_cartRepository &
.& '
GetCartByUserId' 6
(6 7
userId7 =
)= >
;> ?
if 
( 
cart 
== 
null 
) 
return $
null% )
;) *
var 
cartDto 
= 
new 
CartDTO %
{ 
CartId 
= 
cart 
. 
CartId $
,$ %
UserId 
= 
cart 
. 
UserId $
,$ %
TotalAmount 
= 
cart "
." #
TotalAmount# .
,. /
DateCreated 
= 
cart "
." #
DateCreated# .
,. /
IsActive   
=   
cart   
.    
IsActive    (
,  ( )
	CartItems!! 
=!! 
cart!!  
.!!  !
	CartItems!!! *
.!!* +
Select!!+ 1
(!!1 2
ci!!2 4
=>!!5 7
new!!8 ;
CartItemDTO!!< G
{"" 

CartItemId## 
=##  
ci##! #
.### $

CartItemId##$ .
,##. /
	ProductId$$ 
=$$ 
ci$$  "
.$$" #
	ProductId$$# ,
,$$, -
ProductName%% 
=%%  !
ci%%" $
.%%$ %
Product%%% ,
.%%, -
ProductName%%- 8
,%%8 9
ImageUrl&& 
=&& 
ci&& !
.&&! "
Product&&" )
.&&) *
ImageUrl&&* 2
,&&2 3
Price'' 
='' 
ci'' 
.'' 
Product'' &
.''& '
Price''' ,
,'', -
Quantity(( 
=(( 
ci(( !
.((! "
Quantity((" *
,((* +

TotalPrice)) 
=))  
ci))! #
.))# $

TotalPrice))$ .
}** 
)** 
.** 
ToList** 
(** 
)** 
}++ 
;++ 
return-- 
cartDto-- 
;-- 
}.. 	
public00 
void00 
	AddToCart00 
(00 
int00 !
userId00" (
,00( )
CartItemDTO00* 5
cartItemDto006 A
)00A B
{11 	
var22 
cart22 
=22 
_cartRepository22 &
.22& '
GetCartByUserId22' 6
(226 7
userId227 =
)22= >
;22> ?
if33 
(33 
cart33 
==33 
null33 
)33 
{44 
cart55 
=55 
new55 
Cart55 
{66 
UserId77 
=77 
userId77 #
,77# $
DateCreated88 
=88  !
DateTime88" *
.88* +
Now88+ .
,88. /
IsActive99 
=99 
true99 #
,99# $
	CartItems:: 
=:: 
new::  #
List::$ (
<::( )
CartItem::) 1
>::1 2
(::2 3
)::3 4
};; 
;;; 
}<< 
_cartRepository>> 
.>> 

UpdateCart>> &
(>>& '
cart>>' +
)>>+ ,
;>>, -
_cartRepository?? 
.?? 
Save??  
(??  !
)??! "
;??" #
varAA 
cartItemAA 
=AA 
newAA 
CartItemAA '
{BB 
	ProductIdCC 
=CC 
cartItemDtoCC '
.CC' (
	ProductIdCC( 1
,CC1 2
CartIdDD 
=DD 
cartDD 
.DD 
CartIdDD $
,DD$ %
QuantityEE 
=EE 
cartItemDtoEE &
.EE& '
QuantityEE' /
,EE/ 0
	UnitPriceFF 
=FF 
cartItemDtoFF '
.FF' (
PriceFF( -
,FF- .

TotalPriceGG 
=GG 
cartItemDtoGG (
.GG( )
QuantityGG) 1
*GG2 3
cartItemDtoGG4 ?
.GG? @
PriceGG@ E
}HH 
;HH 
_cartRepositoryJJ 
.JJ 
	AddToCartJJ %
(JJ% &
cartItemJJ& .
)JJ. /
;JJ/ 0
_cartRepositoryKK 
.KK 
SaveKK  
(KK  !
)KK! "
;KK" #
}LL 	
publicNN 
voidNN 

UpdateCartNN 
(NN 
intNN "
userIdNN# )
,NN) *
CartDTONN+ 2
cartDtoNN3 :
)NN: ;
{OO 	
varQQ 
cartQQ 
=QQ 
_cartRepositoryQQ &
.QQ& '
GetCartByUserIdQQ' 6
(QQ6 7
userIdQQ7 =
)QQ= >
;QQ> ?
ifSS 
(SS 
cartSS 
!=SS 
nullSS 
)SS 
{TT 
decimalVV 
totalAmountVV #
=VV$ %
$numVV& '
;VV' (
foreachYY 
(YY 
varYY 
itemDtoYY $
inYY% '
cartDtoYY( /
.YY/ 0
	CartItemsYY0 9
)YY9 :
{ZZ 
var\\ 
existingItem\\ $
=\\% &
cart\\' +
.\\+ ,
	CartItems\\, 5
.\\5 6
FirstOrDefault\\6 D
(\\D E
ci\\E G
=>\\H J
ci\\K M
.\\M N
	ProductId\\N W
==\\X Z
itemDto\\[ b
.\\b c
	ProductId\\c l
)\\l m
;\\m n
if^^ 
(^^ 
existingItem^^ $
!=^^% '
null^^( ,
)^^, -
{__ 
existingItemaa $
.aa$ %
Quantityaa% -
=aa. /
itemDtoaa0 7
.aa7 8
Quantityaa8 @
;aa@ A
existingItembb $
.bb$ %
	UnitPricebb% .
=bb/ 0
itemDtobb1 8
.bb8 9
Pricebb9 >
;bb> ?
existingItemcc $
.cc$ %

TotalPricecc% /
=cc0 1
itemDtocc2 9
.cc9 :
Quantitycc: B
*ccC D
itemDtoccE L
.ccL M
PriceccM R
;ccR S
}dd 
elseee 
{ff 
varhh 
newCartItemhh '
=hh( )
newhh* -
CartItemhh. 6
{ii 
	ProductIdjj %
=jj& '
itemDtojj( /
.jj/ 0
	ProductIdjj0 9
,jj9 :
Quantitykk $
=kk% &
itemDtokk' .
.kk. /
Quantitykk/ 7
,kk7 8
	UnitPricell %
=ll& '
itemDtoll( /
.ll/ 0
Pricell0 5
,ll5 6

TotalPricemm &
=mm' (
itemDtomm) 0
.mm0 1
Quantitymm1 9
*mm: ;
itemDtomm< C
.mmC D
PricemmD I
}nn 
;nn 
cartoo 
.oo 
	CartItemsoo &
.oo& '
Addoo' *
(oo* +
newCartItemoo+ 6
)oo6 7
;oo7 8
}pp 
}qq 
totalAmounttt 
=tt 
carttt "
.tt" #
	CartItemstt# ,
.tt, -
Sumtt- 0
(tt0 1
citt1 3
=>tt4 6
citt7 9
.tt9 :

TotalPricett: D
)ttD E
;ttE F
cartww 
.ww 
TotalAmountww  
=ww! "
totalAmountww# .
;ww. /
cartxx 
.xx 
UpdatedDatexx  
=xx! "
DateTimexx# +
.xx+ ,
Nowxx, /
;xx/ 0
_cartRepository{{ 
.{{  

UpdateCart{{  *
({{* +
cart{{+ /
){{/ 0
;{{0 1
_cartRepository|| 
.||  
Save||  $
(||$ %
)||% &
;||& '
}}} 
}~~ 	
public
ÅÅ 
void
ÅÅ 
RemoveFromCart
ÅÅ "
(
ÅÅ" #
int
ÅÅ# &
userId
ÅÅ' -
,
ÅÅ- .
int
ÅÅ/ 2

cartItemId
ÅÅ3 =
)
ÅÅ= >
{
ÇÇ 	
var
ÉÉ 
cart
ÉÉ 
=
ÉÉ 
_cartRepository
ÉÉ &
.
ÉÉ& '
GetCartByUserId
ÉÉ' 6
(
ÉÉ6 7
userId
ÉÉ7 =
)
ÉÉ= >
;
ÉÉ> ?
if
ÑÑ 
(
ÑÑ 
cart
ÑÑ 
!=
ÑÑ 
null
ÑÑ 
)
ÑÑ 
{
ÖÖ 
_cartRepository
ÜÜ 
.
ÜÜ  
RemoveFromCart
ÜÜ  .
(
ÜÜ. /

cartItemId
ÜÜ/ 9
)
ÜÜ9 :
;
ÜÜ: ;
_cartRepository
áá 
.
áá  
Save
áá  $
(
áá$ %
)
áá% &
;
áá& '
}
àà 
}
ââ 	
}
ää 
}ãã É
\D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Service\AuthService.cs
	namespace

 	
EcomLib


 
.

 
Service

 
{ 
public 

class 
AuthService 
{ 
private 
readonly 
ILoginRepository )
_loginRepository* :
;: ;
private 
readonly 
IUserRepository (
_userRepository) 8
;8 9
private 
readonly 
TokenGeneration (
_tokenGeneration) 9
;9 :
public 
AuthService 
( 
ILoginRepository +
loginRepository, ;
,; <
IUserRepository= L
userRepositoryM [
,[ \
TokenGeneration] l
tokenGenerationm |
)| }
{ 	
_loginRepository 
= 
loginRepository .
;. /
_userRepository 
= 
userRepository ,
;, -
_tokenGeneration 
= 
tokenGeneration .
;. /
} 	
public 
async 
Task 
< 
string  
>  !&
LoginAndGenerateTokenAsync" <
(< =
string= C
usernameOrEmailD S
,S T
stringU [
password\ d
)d e
{ 	
var 
isValidLogin 
= 
await $
_loginRepository% 5
.5 6
ValidateLoginAsync6 H
(H I
usernameOrEmailI X
,X Y
passwordZ b
)b c
;c d
if 
( 
! 
isValidLogin 
) 
{ 
throw   
new   '
UnauthorizedAccessException   5
(  5 6
$str  6 ]
)  ] ^
;  ^ _
}!! 
var$$ 
user$$ 
=$$ 
await$$ 
_userRepository$$ ,
.$$, -)
GetUserByEmailOrUsernameAsync$$- J
($$J K
usernameOrEmail$$K Z
)$$Z [
;$$[ \
return%% 
_tokenGeneration%% #
.%%# $
GenerateJWT%%$ /
(%%/ 0
user%%0 4
)%%4 5
;%%5 6
}&& 	
}'' 
}(( ˘
dD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Seeding\ApplicationDbSeeder.cs
public 
static 
class 
ApplicationDbSeeder '
{		 
public

 

static

 
void

 
Seed

 
(

 
AppDbContext

 (
context

) 0
)

0 1
{ 
if 

( 
! 
context 
. 
Users 
. 
Any 
( 
u  
=>! #
u$ %
.% &
Email& +
==, .
$str/ @
)@ A
)A B
{ 	
var 
	adminUser 
= 
new 
User  $
{ 
Username 
= 
$str $
,$ %
Email 
= 
$str )
,) *
IsActive 
= 
true 
,  
Role 
= 
UserRole 
.  
Admin  %
,% &
DateCreated 
= 
DateTime &
.& '
UtcNow' -
} 
; 
	adminUser 
. 
PasswordHash "
=# $
BCrypt% +
.+ ,
Net, /
./ 0
BCrypt0 6
.6 7
HashPassword7 C
(C D
$strD M
)M N
;N O
context 
. 
Users 
. 
Add 
( 
	adminUser '
)' (
;( )
context 
. 
SaveChanges 
(  
)  !
;! "
} 	
if 

( 
! 
context 
. 
Users 
. 
Any 
( 
u  
=>! #
u$ %
.% &
Email& +
==, .
$str/ @
)@ A
)A B
{ 	
var 
	adminUser 
= 
new 
User  $
{ 
Username   
=   
$str   $
,  $ %
Email!! 
=!! 
$str!! )
,!!) *
IsActive"" 
="" 
true"" 
,""  
Role## 
=## 
UserRole## 
.##  
Admin##  %
,##% &
DateCreated$$ 
=$$ 
DateTime$$ &
.$$& '
UtcNow$$' -
}%% 
;%% 
	adminUser&& 
.&& 
PasswordHash&& "
=&&# $
BCrypt&&% +
.&&+ ,
Net&&, /
.&&/ 0
BCrypt&&0 6
.&&6 7
HashPassword&&7 C
(&&C D
$str&&D M
)&&M N
;&&N O
context(( 
.(( 
Users(( 
.(( 
Add(( 
((( 
	adminUser(( '
)((' (
;((( )
context)) 
.)) 
SaveChanges)) 
())  
)))  !
;))! "
}** 	
}++ 
}-- «"
yD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\WishListRepository\WishlistRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
WishListRepository /
{ 
public 

class 
WishlistRepository #
:# $
IWishlistRepository$ 7
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public 
WishlistRepository !
(! "
AppDbContext" .
context/ 6
)6 7
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
AddToWishlist '
(' (
int( +
userId, 2
,2 3
int4 7
	productId8 A
)A B
{ 	
var 
wishlist 
= 
new 
Wishlist '
{ 
UserId 
= 
userId 
,  
	ProductId 
= 
	productId %
,% &
	DateAdded 
= 
DateTime $
.$ %
Now% (
} 
; 
_context   
.   
	Wishlists   
.   
Add   "
(  " #
wishlist  # +
)  + ,
;  , -
await!! 
_context!! 
.!! 
SaveChangesAsync!! +
(!!+ ,
)!!, -
;!!- .
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
List$$ 
<$$ 
WishlistProductDTO$$ 1
>$$1 2
>$$2 3
GetUserWishlist$$4 C
($$C D
int$$D G
userId$$H N
)$$N O
{%% 	
return&& 
await&& 
_context&& !
.&&! "
	Wishlists&&" +
.'' 
Where'' 
('' 
w'' 
=>'' 
w'' 
.'' 
UserId'' $
==''% '
userId''( .
)''. /
.(( 
Select(( 
((( 
w(( 
=>(( 
new((  
WishlistProductDTO((! 3
{)) 
	ProductId** 
=** 
w**  !
.**! "
Product**" )
.**) *
	ProductId*** 3
,**3 4
ProductName++ 
=++  !
w++" #
.++# $
Product++$ +
.+++ ,
ProductName++, 7
,++7 8
WishlistAddedDate,, %
=,,& '
w,,( )
.,,) *
	DateAdded,,* 3
,,,3 4
Price-- 
=-- 
w-- 
.-- 
Product-- %
.--% &
Price--& +
,--+ ,
ImageUrl.. 
=.. 
w..  
...  !
Product..! (
...( )
ImageUrl..) 1
,..1 2
Description// 
=//  !
w//" #
.//# $
Product//$ +
.//+ ,
Description//, 7
}00 
)00 
.11 
ToListAsync11 
(11 
)11 
;11 
}22 	
public55 
async55 
Task55 
RemoveFromWishlist55 ,
(55, -
int55- 0
userId551 7
,557 8
int559 <
	productId55= F
)55F G
{66 	
var77 
wishlist77 
=77 
await77  
_context77! )
.77) *
	Wishlists77* 3
.88 
FirstOrDefaultAsync88 $
(88$ %
w88% &
=>88' )
w88* +
.88+ ,
UserId88, 2
==883 5
userId886 <
&&88= ?
w88@ A
.88A B
	ProductId88B K
==88L N
	productId88O X
)88X Y
;88Y Z
if:: 
(:: 
wishlist:: 
!=:: 
null::  
)::  !
{;; 
_context<< 
.<< 
	Wishlists<< "
.<<" #
Remove<<# )
(<<) *
wishlist<<* 2
)<<2 3
;<<3 4
await== 
_context== 
.== 
SaveChangesAsync== /
(==/ 0
)==0 1
;==1 2
}>> 
}?? 	
}@@ 
}BB ‡
zD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\WishListRepository\IWishlistRepository.cs
	namespace		 	
EcomLib		
 
.		 

Repository		 
.		 
WishListRepository		 /
{

 
public 

	interface 
IWishlistRepository (
{ 
Task 
AddToWishlist 
( 
int 
userId %
,% &
int' *
	productId+ 4
)4 5
;5 6
Task 
< 
List 
< 
WishlistProductDTO $
>$ %
>% &
GetUserWishlist' 6
(6 7
int7 :
userId; A
)A B
;B C
Task 
RemoveFromWishlist 
(  
int  #
userId$ *
,* +
int, /
	productId0 9
)9 :
;: ;
} 
} ﬁè
rD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\UserRepository\UserRepository .cs
	namespace 	
	EcomQuitQ
 
. 
BusinessLogicLayer &
.& '
UserRepository' 5
{ 
public 

class 
UserRepository 
:  
IUserRepository  /
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
UserRepository 
( 
AppDbContext *
context+ 2
,2 3
IConfiguration3 A
configurationB O
)O P
{ 	
_context 
= 
context 
; 
_configuration 
= 
configuration *
;* +
} 	
public 
async 
Task 
< 
User 
> 
GetUserById  +
(+ ,
int, /
userId0 6
)6 7
{ 	
return 
await 
_context !
.! "
Users" '
.' (
	FindAsync( 1
(1 2
userId2 8
)8 9
;9 :
}   	
public"" 
async"" 
Task"" 
<"" 

GetUserDTO"" $
>""$ %
GetUserByIdAsync""& 6
(""6 7
int""7 :
userId""; A
)""A B
{## 	
return$$ 
await$$ 
_context$$ !
.$$! "
Users$$" '
.%% 
Where%% 
(%% 
u%% 
=>%% 
u%% 
.%% 
UserId%% $
==%%% '
userId%%( .
)%%. /
.&& 
Select&& 
(&& 
u&& 
=>&& 
new&&  

GetUserDTO&&! +
{'' 
UserId(( 
=(( 
u(( 
.(( 
UserId(( %
,((% &
UserName)) 
=)) 
u))  
.))  !
Username))! )
,))) *
Email** 
=** 
u** 
.** 
Email** #
,**# $
Role++ 
=++ 
u++ 
.++ 
Role++ !
.++! "
ToString++" *
(++* +
)+++ ,
,++, -
DateCreated,, 
=,,  !
u,," #
.,,# $
DateCreated,,$ /
,,,/ 0
IsActive-- 
=-- 
u--  
.--  !
IsActive--! )
,--) *
FullName.. 
=.. 
$".. !
{..! "
u.." #
...# $
PersonalDetails..$ 3
...3 4
	FirstName..4 =
??..> @
$str..A F
}..F G
$str..G H
{..H I
u..I J
...J K
PersonalDetails..K Z
...Z [
LastName..[ c
??..d f
$str..g l
}..l m
"..m n
,..n o
Gender// 
=// 
u// 
.// 
PersonalDetails// .
.//. /
Gender/// 5
??//6 8
$str//9 B
,//B C
DateOfBirth00 
=00  !
u00" #
.00# $
PersonalDetails00$ 3
.003 4
DateOfBirth004 ?
,00? @
PhoneNumber11 
=11  !
u11" #
.11# $
PersonalDetails11$ 3
.113 4
PhoneNumber114 ?
??11@ B
$str11C H
,11H I
Address22 
=22 
$"22  
{22  !
u22! "
.22" #
Address22# *
.22* +
AddressLine122+ 7
??228 :
$str22; @
}22@ A
$str22A C
{22C D
u22D E
.22E F
Address22F M
.22M N
AddressLine222N Z
??22[ ]
$str22^ c
}22c d
$str22d f
{22f g
u22g h
.22h i
Address22i p
.22p q
City22q u
??22v x
$str22y ~
}22~ 
$str	22 Å
{
22Å Ç
u
22Ç É
.
22É Ñ
Address
22Ñ ã
.
22ã å
State
22å ë
??
22í î
$str
22ï ö
}
22ö õ
$str
22õ £
{
22£ §
u
22§ •
.
22• ¶
Address
22¶ ≠
.
22≠ Æ

PostalCode
22Æ ∏
??
22π ª
$str
22º ¡
}
22¡ ¬
$str
22¬ ƒ
{
22ƒ ≈
u
22≈ ∆
.
22∆ «
Address
22« Œ
.
22Œ œ
Country
22œ ÷
??
22◊ Ÿ
$str
22⁄ ﬂ
}
22ﬂ ‡
"
22‡ ·
}33 
)33 
.44 
FirstOrDefaultAsync44 $
(44$ %
)44% &
;44& '
}55 	
public77 
async77 
Task77 
<77 
IEnumerable77 %
<77% &

GetUserDTO77& 0
>770 1
>771 2
GetAllUsersAsync773 C
(77C D
)77D E
{88 	
return99 
await99 
_context99 !
.99! "
Users99" '
.:: 
Select:: 
(:: 
u:: 
=>:: 
new:: 

GetUserDTO:: '
{;; 
UserId<< 
=<< 
u<< 
.<< 
UserId<< !
,<<! "
UserName== 
=== 
u== 
.== 
Username== %
,==% &
Email>> 
=>> 
u>> 
.>> 
Email>> 
,>>  
Role?? 
=?? 
u?? 
.?? 
Role?? 
.?? 
ToString?? &
(??& '
)??' (
,??( )
DateCreated@@ 
=@@ 
u@@ 
.@@  
DateCreated@@  +
,@@+ ,
IsActiveAA 
=AA 
uAA 
.AA 
IsActiveAA %
,AA% &
FullNameBB 
=BB 
$"BB 
{BB 
uBB 
.BB  
PersonalDetailsBB  /
.BB/ 0
	FirstNameBB0 9
??BB: <
$strBB= B
}BBB C
$strBBC D
{BBD E
uBBE F
.BBF G
PersonalDetailsBBG V
.BBV W
LastNameBBW _
??BB` b
$strBBc h
}BBh i
"BBi j
,BBj k
GenderCC 
=CC 
uCC 
.CC 
PersonalDetailsCC *
.CC* +
GenderCC+ 1
??CC2 4
$strCC5 >
,CC> ?
DateOfBirthDD 
=DD 
uDD 
.DD  
PersonalDetailsDD  /
.DD/ 0
DateOfBirthDD0 ;
,DD; <
PhoneNumberEE 
=EE 
uEE 
.EE  
PersonalDetailsEE  /
.EE/ 0
PhoneNumberEE0 ;
??EE< >
$strEE? D
,EED E
AddressFF 
=FF 
$"FF 
{FF 
uFF 
.FF 
AddressFF &
.FF& '
AddressLine1FF' 3
??FF4 6
$strFF7 <
}FF< =
$strFF= ?
{FF? @
uFF@ A
.FFA B
AddressFFB I
.FFI J
AddressLine2FFJ V
??FFW Y
$strFFZ _
}FF_ `
$strFF` b
{FFb c
uFFc d
.FFd e
AddressFFe l
.FFl m
CityFFm q
??FFr t
$strFFu z
}FFz {
$strFF{ }
{FF} ~
uFF~ 
.	FF Ä
Address
FFÄ á
.
FFá à
State
FFà ç
??
FFé ê
$str
FFë ñ
}
FFñ ó
$str
FFó ü
{
FFü †
u
FF† °
.
FF° ¢
Address
FF¢ ©
.
FF© ™

PostalCode
FF™ ¥
??
FFµ ∑
$str
FF∏ Ω
}
FFΩ æ
$str
FFæ ¿
{
FF¿ ¡
u
FF¡ ¬
.
FF¬ √
Address
FF√  
.
FF  À
Country
FFÀ “
??
FF” ’
$str
FF÷ €
}
FF€ ‹
"
FF‹ ›
}GG 
)GG 
.HH 
ToListAsyncHH 
(HH 
)HH 
;HH 
}II 	
publicJJ 
asyncJJ 
TaskJJ 
<JJ 

GetUserDTOJJ $
>JJ$ %"
GetUserByUsernameAsyncJJ& <
(JJ< =
stringJJ= C
usernameJJD L
)JJL M
{KK 	
returnLL 
awaitLL 
_contextLL !
.LL! "
UsersLL" '
.LL' (
WhereLL( -
(LL- .
uLL. /
=>LL0 2
uLL3 4
.LL4 5
UsernameLL5 =
==LL> @
usernameLLA I
)LLI J
.MM 
SelectMM 
(MM 
uMM 
=>MM 
newMM  

GetUserDTOMM! +
{NN 
UserIdOO 
=OO 
uOO 
.OO 
UserIdOO %
,OO% &
UserNamePP 
=PP 
uPP  
.PP  !
UsernamePP! )
,PP) *
EmailQQ 
=QQ 
uQQ 
.QQ 
EmailQQ #
,QQ# $
RoleRR 
=RR 
uRR 
.RR 
RoleRR !
.RR! "
ToStringRR" *
(RR* +
)RR+ ,
,RR, -
DateCreatedSS 
=SS  !
uSS" #
.SS# $
DateCreatedSS$ /
,SS/ 0
IsActiveTT 
=TT 
uTT  
.TT  !
IsActiveTT! )
,TT) *
FullNameUU 
=UU 
$"UU !
{UU! "
uUU" #
.UU# $
PersonalDetailsUU$ 3
.UU3 4
	FirstNameUU4 =
??UU> @
$strUUA F
}UUF G
$strUUG H
{UUH I
uUUI J
.UUJ K
PersonalDetailsUUK Z
.UUZ [
LastNameUU[ c
??UUd f
$strUUg l
}UUl m
"UUm n
,UUn o
GenderVV 
=VV 
uVV 
.VV 
PersonalDetailsVV .
.VV. /
GenderVV/ 5
??VV6 8
$strVV9 B
,VVB C
DateOfBirthWW 
=WW  !
uWW" #
.WW# $
PersonalDetailsWW$ 3
.WW3 4
DateOfBirthWW4 ?
,WW? @
PhoneNumberXX 
=XX  !
uXX" #
.XX# $
PersonalDetailsXX$ 3
.XX3 4
PhoneNumberXX4 ?
??XX@ B
$strXXC H
,XXH I
AddressYY 
=YY 
$"YY  
{YY  !
uYY! "
.YY" #
AddressYY# *
.YY* +
AddressLine1YY+ 7
??YY8 :
$strYY; @
}YY@ A
$strYYA C
{YYC D
uYYD E
.YYE F
AddressYYF M
.YYM N
AddressLine2YYN Z
??YY[ ]
$strYY^ c
}YYc d
$strYYd f
{YYf g
uYYg h
.YYh i
AddressYYi p
.YYp q
CityYYq u
??YYv x
$strYYy ~
}YY~ 
$str	YY Å
{
YYÅ Ç
u
YYÇ É
.
YYÉ Ñ
Address
YYÑ ã
.
YYã å
State
YYå ë
??
YYí î
$str
YYï ö
}
YYö õ
$str
YYõ £
{
YY£ §
u
YY§ •
.
YY• ¶
Address
YY¶ ≠
.
YY≠ Æ

PostalCode
YYÆ ∏
??
YYπ ª
$str
YYº ¡
}
YY¡ ¬
$str
YY¬ ƒ
{
YYƒ ≈
u
YY≈ ∆
.
YY∆ «
Address
YY« Œ
.
YYŒ œ
Country
YYœ ÷
??
YY◊ Ÿ
$str
YY⁄ ﬂ
}
YYﬂ ‡
"
YY‡ ·
}ZZ 
)ZZ 
.[[ 
FirstOrDefaultAsync[[ $
([[$ %
)[[% &
;[[& '
}\\ 	
public^^ 
async^^ 
Task^^ 
<^^ 

GetUserDTO^^ $
>^^$ %
GetUserByEmailAsync^^& 9
(^^9 :
string^^: @
email^^A F
)^^F G
{__ 	
return`` 
await`` 
_context`` !
.``! "
Users``" '
.aa 
Whereaa 
(aa 
uaa 
=>aa 
uaa 
.aa 
Emailaa #
==aa$ &
emailaa' ,
)aa, -
.bb 
Selectbb 
(bb 
ubb 
=>bb 
newbb  

GetUserDTObb! +
{cc 
UserIddd 
=dd 
udd 
.dd 
UserIddd %
,dd% &
UserNameee 
=ee 
uee  
.ee  !
Usernameee! )
,ee) *
Emailff 
=ff 
uff 
.ff 
Emailff #
,ff# $
Rolegg 
=gg 
ugg 
.gg 
Rolegg !
.gg! "
ToStringgg" *
(gg* +
)gg+ ,
,gg, -
DateCreatedhh 
=hh  !
uhh" #
.hh# $
DateCreatedhh$ /
,hh/ 0
IsActiveii 
=ii 
uii  
.ii  !
IsActiveii! )
,ii) *
FullNamejj 
=jj 
$"jj !
{jj! "
ujj" #
.jj# $
PersonalDetailsjj$ 3
.jj3 4
	FirstNamejj4 =
??jj> @
$strjjA F
}jjF G
$strjjG H
{jjH I
ujjI J
.jjJ K
PersonalDetailsjjK Z
.jjZ [
LastNamejj[ c
??jjd f
$strjjg l
}jjl m
"jjm n
,jjn o
Genderkk 
=kk 
ukk 
.kk 
PersonalDetailskk .
.kk. /
Genderkk/ 5
??kk6 8
$strkk9 B
,kkB C
DateOfBirthll 
=ll  !
ull" #
.ll# $
PersonalDetailsll$ 3
.ll3 4
DateOfBirthll4 ?
,ll? @
PhoneNumbermm 
=mm  !
umm" #
.mm# $
PersonalDetailsmm$ 3
.mm3 4
PhoneNumbermm4 ?
??mm@ B
$strmmC H
,mmH I
Addressnn 
=nn 
$"nn  
{nn  !
unn! "
.nn" #
Addressnn# *
.nn* +
AddressLine1nn+ 7
??nn8 :
$strnn; @
}nn@ A
$strnnA C
{nnC D
unnD E
.nnE F
AddressnnF M
.nnM N
AddressLine2nnN Z
??nn[ ]
$strnn^ c
}nnc d
$strnnd f
{nnf g
unng h
.nnh i
Addressnni p
.nnp q
Citynnq u
??nnv x
$strnny ~
}nn~ 
$str	nn Å
{
nnÅ Ç
u
nnÇ É
.
nnÉ Ñ
Address
nnÑ ã
.
nnã å
State
nnå ë
??
nní î
$str
nnï ö
}
nnö õ
$str
nnõ £
{
nn£ §
u
nn§ •
.
nn• ¶
Address
nn¶ ≠
.
nn≠ Æ

PostalCode
nnÆ ∏
??
nnπ ª
$str
nnº ¡
}
nn¡ ¬
$str
nn¬ ƒ
{
nnƒ ≈
u
nn≈ ∆
.
nn∆ «
Address
nn« Œ
.
nnŒ œ
Country
nnœ ÷
??
nn◊ Ÿ
$str
nn⁄ ﬂ
}
nnﬂ ‡
"
nn‡ ·
}oo 
)oo 
.pp 
FirstOrDefaultAsyncpp $
(pp$ %
)pp% &
;pp& '
}qq 	
publicss 
asyncss 
Taskss 
<ss 
Userss 
>ss )
GetUserByEmailOrUsernameAsyncss  =
(ss= >
stringss> D
emailOrUsernamessE T
)ssT U
{tt 	
returnuu 
awaituu 
_contextuu !
.uu! "
Usersuu" '
.vv  
SingleOrDefaultAsyncvv %
(vv% &
uvv& '
=>vv( *
uvv+ ,
.vv, -
Emailvv- 2
==vv3 5
emailOrUsernamevv6 E
||vvF H
uvvI J
.vvJ K
UsernamevvK S
==vvT V
emailOrUsernamevvW f
)vvf g
;vvg h
}ww 	
publicyy 
asyncyy 
Taskyy 
<yy 
intyy 
>yy 
AddUserAsyncyy +
(yy+ ,
Useryy, 0
useryy1 5
)yy5 6
{zz 	
await{{ 
_context{{ 
.{{ 
Users{{  
.{{  !
AddAsync{{! )
({{) *
user{{* .
){{. /
;{{/ 0
await|| 
_context|| 
.|| 
SaveChangesAsync|| +
(||+ ,
)||, -
;||- .
return}} 
user}} 
.}} 
UserId}} 
;}} 
}~~ 	
public
ÄÄ 
async
ÄÄ 
Task
ÄÄ 
DeleteUserAsync
ÄÄ )
(
ÄÄ) *
int
ÄÄ* -
userId
ÄÄ. 4
)
ÄÄ4 5
{
ÅÅ 	
var
ÇÇ 
user
ÇÇ 
=
ÇÇ 
_context
ÇÇ 
.
ÇÇ  
Users
ÇÇ  %
.
ÇÇ% &
SingleOrDefault
ÇÇ& 5
(
ÇÇ5 6
u
ÇÇ6 7
=>
ÇÇ8 :
u
ÇÇ; <
.
ÇÇ< =
UserId
ÇÇ= C
==
ÇÇC E
userId
ÇÇF L
)
ÇÇL M
;
ÇÇM N
if
ÉÉ 
(
ÉÉ 
user
ÉÉ 
!=
ÉÉ 
null
ÉÉ 
)
ÉÉ 
{
ÑÑ 
_context
ÖÖ 
.
ÖÖ 
Users
ÖÖ 
.
ÖÖ 
Remove
ÖÖ %
(
ÖÖ% &
user
ÖÖ& *
)
ÖÖ* +
;
ÖÖ+ ,
await
ÜÜ 
_context
ÜÜ 
.
ÜÜ 
SaveChangesAsync
ÜÜ /
(
ÜÜ/ 0
)
ÜÜ0 1
;
ÜÜ1 2
}
áá 
}
àà 	
public
ää 
async
ää 
Task
ää 
<
ää 
bool
ää 
>
ää 
UserExistsAsync
ää  /
(
ää/ 0
string
ää0 6
emailOrUsername
ää7 F
)
ääF G
{
ãã 	
return
åå 
await
åå 
_context
åå !
.
åå! "
Users
åå" '
.
åå' (
AnyAsync
åå( 0
(
åå0 1
u
åå1 2
=>
åå3 5
u
åå6 7
.
åå7 8
Email
åå8 =
==
åå> @
emailOrUsername
ååA P
||
ååQ S
u
ååT U
.
ååU V
Username
ååV ^
==
åå_ a
emailOrUsername
ååb q
)
ååq r
;
åår s
}
çç 	
public
èè 
async
èè 
Task
èè 
UpdateUserAsync
èè )
(
èè) *
User
èè* .
user
èè/ 3
)
èè3 4
{
êê 	
_context
ëë 
.
ëë 
Users
ëë 
.
ëë 
Update
ëë !
(
ëë! "
user
ëë" &
)
ëë& '
;
ëë' (
await
íí 
_context
íí 
.
íí 
SaveChangesAsync
íí +
(
íí+ ,
)
íí, -
;
íí- .
}
ìì 	
public
îî 
async
îî 
Task
îî 
UpdateUserAsync
îî )
(
îî) *
UserDTO
îî* 1
userDto
îî2 9
,
îî9 :
int
îî; >
userId
îî? E
)
îîE F
{
ïï 	
var
ññ 
user
ññ 
=
ññ 
await
ññ 
_context
ññ %
.
ññ% &
Users
ññ& +
.
ññ+ ,
	FindAsync
ññ, 5
(
ññ5 6
userId
ññ6 <
)
ññ< =
;
ññ= >
if
óó 
(
óó 
user
óó 
==
óó 
null
óó 
)
óó 
{
òò 
throw
ôô 
new
ôô #
UserNotFoundException
ôô /
(
ôô/ 0
$str
ôô0 @
)
ôô@ A
;
ôôA B
}
öö 
user
ùù 
.
ùù 
Username
ùù 
=
ùù 
userDto
ùù #
.
ùù# $
Username
ùù$ ,
;
ùù, -
user
ûû 
.
ûû 
Email
ûû 
=
ûû 
userDto
ûû  
.
ûû  !
Email
ûû! &
;
ûû& '
user
üü 
.
üü 
IsActive
üü 
=
üü 
userDto
üü #
.
üü# $
IsActive
üü$ ,
;
üü, -
_context
°° 
.
°° 
Users
°° 
.
°° 
Update
°° !
(
°°! "
user
°°" &
)
°°& '
;
°°' (
await
¢¢ 
_context
¢¢ 
.
¢¢ 
SaveChangesAsync
¢¢ +
(
¢¢+ ,
)
¢¢, -
;
¢¢- .
}
££ 	
public
•• 
async
•• 
Task
•• (
UpdatePersonalDetailsAsync
•• 4
(
••4 5
PersonalDetails
••5 D
personalDetails
••E T
)
••T U
{
¶¶ 	
_context
ßß 
.
ßß 
PersonalDetails
ßß $
.
ßß$ %
Update
ßß% +
(
ßß+ ,
personalDetails
ßß, ;
)
ßß; <
;
ßß< =
await
®® 
_context
®® 
.
®® 
SaveChangesAsync
®® +
(
®®+ ,
)
®®, -
;
®®- .
}
©© 	
public
¨¨ 
async
¨¨ 
Task
¨¨ 
<
¨¨ 
SellerDetails
¨¨ '
>
¨¨' (+
GetSellerDetailsByUserIdAsync
¨¨) F
(
¨¨F G
int
¨¨G J
userId
¨¨K Q
)
¨¨Q R
{
≠≠ 	
return
ÆÆ 
await
ÆÆ 
_context
ÆÆ !
.
ÆÆ! "
SellerDetails
ÆÆ" /
.
ÆÆ/ 0!
FirstOrDefaultAsync
ÆÆ0 C
(
ÆÆC D
s
ÆÆD E
=>
ÆÆF H
s
ÆÆI J
.
ÆÆJ K
UserId
ÆÆK Q
==
ÆÆR T
userId
ÆÆU [
)
ÆÆ[ \
;
ÆÆ\ ]
}
ØØ 	
public
±± 
async
±± 
Task
±± #
AddSellerDetailsAsync
±± /
(
±±/ 0
SellerDetails
±±0 =
sellerDetails
±±> K
)
±±K L
{
≤≤ 	
await
≥≥ 
_context
≥≥ 
.
≥≥ 
SellerDetails
≥≥ (
.
≥≥( )
AddAsync
≥≥) 1
(
≥≥1 2
sellerDetails
≥≥2 ?
)
≥≥? @
;
≥≥@ A
await
¥¥ 
_context
¥¥ 
.
¥¥ 
SaveChangesAsync
¥¥ +
(
¥¥+ ,
)
¥¥, -
;
¥¥- .
}
µµ 	
public
∑∑ 
async
∑∑ 
Task
∑∑ &
UpdateSellerDetailsAsync
∑∑ 2
(
∑∑2 3
User
∑∑3 7"
updatedSellerDetails
∑∑8 L
)
∑∑L M
{
∏∏ 	
_context
ππ 
.
ππ 
Users
ππ 
.
ππ 
Update
ππ !
(
ππ! ""
updatedSellerDetails
ππ" 6
)
ππ6 7
;
ππ7 8
await
∫∫ 
_context
∫∫ 
.
∫∫ 
SaveChangesAsync
∫∫ +
(
∫∫+ ,
)
∫∫, -
;
∫∫- .
}
ªª 	
public
ΩΩ 
async
ΩΩ 
Task
ΩΩ 
<
ΩΩ 
IEnumerable
ΩΩ %
<
ΩΩ% &
LastRegisteredDTO
ΩΩ& 7
>
ΩΩ7 8
>
ΩΩ8 9&
GetUsersLast24HoursAsync
ΩΩ: R
(
ΩΩR S
)
ΩΩS T
{
ææ 	
var
øø 
	usersList
øø 
=
øø 
_context
øø $
.
øø$ %
Users
øø% *
.
¿¿ 

FromSqlRaw
¿¿ 
(
¿¿ 
$str
¿¿ 9
)
¿¿9 :
.
¡¡ 
AsEnumerable
¡¡ 
(
¡¡ 
)
¡¡ 
.
¬¬ 
Select
¬¬ 
(
¬¬ 
u
¬¬ 
=>
¬¬ 
new
¬¬  
LastRegisteredDTO
¬¬! 2
{
√√ 
UserId
ƒƒ 
=
ƒƒ 
u
ƒƒ 
.
ƒƒ 
UserId
ƒƒ %
,
ƒƒ% &
UserName
≈≈ 
=
≈≈ 
u
≈≈  
.
≈≈  !
Username
≈≈! )
,
≈≈) *
Email
∆∆ 
=
∆∆ 
u
∆∆ 
.
∆∆ 
Email
∆∆ #
,
∆∆# $
Role
«« 
=
«« 
u
«« 
.
«« 
Role
«« !
.
««! "
ToString
««" *
(
««* +
)
««+ ,
,
««, -
DateCreated
»» 
=
»»  !
u
»»" #
.
»»# $
DateCreated
»»$ /
,
»»/ 0
IsActive
…… 
=
…… 
u
……  
.
……  !
IsActive
……! )
}
   
)
   
.
ÀÀ 
ToList
ÀÀ 
(
ÀÀ 
)
ÀÀ 
;
ÀÀ 
if
ÕÕ 
(
ÕÕ 
	usersList
ÕÕ 
.
ÕÕ 
Count
ÕÕ 
==
ÕÕ  "
$num
ÕÕ# $
)
ÕÕ$ %
{
ŒŒ 
throw
œœ 
new
œœ #
UserNotFoundException
œœ /
(
œœ/ 0
$str
œœ0 e
)
œœe f
;
œœf g
}
–– 
return
““ 
	usersList
““ 
;
““ 
}
”” 	
public
’’ 
async
’’ 
Task
’’ 
<
’’ 
IEnumerable
’’ %
<
’’% &
LastRegisteredDTO
’’& 7
>
’’7 8
>
’’8 9$
GetUsersLast7DaysAsync
’’: P
(
’’P Q
)
’’Q R
{
÷÷ 	
var
◊◊ 
	usersList
◊◊ 
=
◊◊ 
_context
◊◊ $
.
◊◊$ %
Users
◊◊% *
.
ÿÿ 

FromSqlRaw
ÿÿ 
(
ÿÿ 
$str
ÿÿ 6
)
ÿÿ6 7
.
ŸŸ 
AsEnumerable
ŸŸ 
(
ŸŸ 
)
ŸŸ 
.
⁄⁄ 
Select
⁄⁄ 
(
⁄⁄ 
u
⁄⁄ 
=>
⁄⁄ 
new
⁄⁄ 
LastRegisteredDTO
⁄⁄  1
{
€€ 
UserId
‹‹ 
=
‹‹ 
u
‹‹ 
.
‹‹ 
UserId
‹‹ $
,
‹‹$ %
UserName
›› 
=
›› 
u
›› 
.
››  
Username
››  (
,
››( )
Email
ﬁﬁ 
=
ﬁﬁ 
u
ﬁﬁ 
.
ﬁﬁ 
Email
ﬁﬁ "
,
ﬁﬁ" #
Role
ﬂﬂ 
=
ﬂﬂ 
u
ﬂﬂ 
.
ﬂﬂ 
Role
ﬂﬂ  
.
ﬂﬂ  !
ToString
ﬂﬂ! )
(
ﬂﬂ) *
)
ﬂﬂ* +
,
ﬂﬂ+ ,
DateCreated
‡‡ 
=
‡‡  
u
‡‡! "
.
‡‡" #
DateCreated
‡‡# .
,
‡‡. /
IsActive
·· 
=
·· 
u
·· 
.
··  
IsActive
··  (
}
‚‚ 
)
‚‚ 
.
„„ 
ToList
„„ 
(
„„ 
)
„„ 
;
„„ 
if
ÂÂ 
(
ÂÂ 
	usersList
ÂÂ 
.
ÂÂ 
Count
ÂÂ 
==
ÂÂ  "
$num
ÂÂ# $
)
ÂÂ$ %
{
ÊÊ 
throw
ÁÁ 
new
ÁÁ #
UserNotFoundException
ÁÁ /
(
ÁÁ/ 0
$str
ÁÁ0 c
)
ÁÁc d
;
ÁÁd e
}
ËË 
return
ÍÍ 
	usersList
ÍÍ 
;
ÍÍ 
}
ÎÎ 	
public
ÌÌ 
async
ÌÌ 
Task
ÌÌ 
<
ÌÌ 
IEnumerable
ÌÌ %
<
ÌÌ% &
LastRegisteredDTO
ÌÌ& 7
>
ÌÌ7 8
>
ÌÌ8 9$
GetUsersLastMonthAsync
ÌÌ: P
(
ÌÌP Q
)
ÌÌQ R
{
ÓÓ 	
var
ÔÔ 
	usersList
ÔÔ 
=
ÔÔ 
_context
ÔÔ $
.
ÔÔ$ %
Users
ÔÔ% *
.
 

FromSqlRaw
 
(
 
$str
 7
)
7 8
.
ÒÒ 
AsEnumerable
ÒÒ 
(
ÒÒ 
)
ÒÒ 
.
ÚÚ 
Select
ÚÚ 
(
ÚÚ 
u
ÚÚ 
=>
ÚÚ 
new
ÚÚ  
LastRegisteredDTO
ÚÚ! 2
{
ÛÛ 
UserId
ÙÙ 
=
ÙÙ 
u
ÙÙ 
.
ÙÙ 
UserId
ÙÙ %
,
ÙÙ% &
UserName
ıı 
=
ıı 
u
ıı  
.
ıı  !
Username
ıı! )
,
ıı) *
Email
ˆˆ 
=
ˆˆ 
u
ˆˆ 
.
ˆˆ 
Email
ˆˆ #
,
ˆˆ# $
Role
˜˜ 
=
˜˜ 
u
˜˜ 
.
˜˜ 
Role
˜˜ !
.
˜˜! "
ToString
˜˜" *
(
˜˜* +
)
˜˜+ ,
,
˜˜, -
DateCreated
¯¯ 
=
¯¯  !
u
¯¯" #
.
¯¯# $
DateCreated
¯¯$ /
,
¯¯/ 0
IsActive
˘˘ 
=
˘˘ 
u
˘˘  
.
˘˘  !
IsActive
˘˘! )
}
˙˙ 
)
˙˙ 
.
˚˚ 
ToList
˚˚ 
(
˚˚ 
)
˚˚ 
;
˚˚ 
if
˝˝ 
(
˝˝ 
	usersList
˝˝ 
.
˝˝ 
Count
˝˝ 
==
˝˝  "
$num
˝˝# $
)
˝˝$ %
{
˛˛ 
throw
ˇˇ 
new
ˇˇ #
UserNotFoundException
ˇˇ /
(
ˇˇ/ 0
$str
ˇˇ0 b
)
ˇˇb c
;
ˇˇc d
}
ÄÄ 
return
ÇÇ 
	usersList
ÇÇ 
;
ÇÇ 
}
ÉÉ 	
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
IEnumerable
ÖÖ %
<
ÖÖ% &%
LastRegisteredSellerDTO
ÖÖ& =
>
ÖÖ= >
>
ÖÖ> ?(
GetSellersLast24HoursAsync
ÖÖ@ Z
(
ÖÖZ [
)
ÖÖ[ \
{
ÜÜ 	
var
áá 
	usersList
áá 
=
áá 
await
áá !.
 SellerDetailsFromStoredProcAsync
áá" B
(
ááB C
$str
ááC ]
)
áá] ^
;
áá^ _
if
ââ 
(
ââ 
!
ââ 
	usersList
ââ 
.
ââ 
Any
ââ 
(
ââ 
)
ââ  
)
ââ  !
throw
ää 
new
ää #
UserNotFoundException
ää /
(
ää/ 0
$str
ää0 [
)
ää[ \
;
ää\ ]
return
åå 
	usersList
åå 
;
åå 
}
çç 	
public
èè 
async
èè 
Task
èè 
<
èè 
IEnumerable
èè %
<
èè% &%
LastRegisteredSellerDTO
èè& =
>
èè= >
>
èè> ?&
GetSellersLast7DaysAsync
èè@ X
(
èèX Y
)
èèY Z
{
êê 	
var
ëë 
	usersList
ëë 
=
ëë 
await
ëë !.
 SellerDetailsFromStoredProcAsync
ëë" B
(
ëëB C
$str
ëëC [
)
ëë[ \
;
ëë\ ]
if
ìì 
(
ìì 
!
ìì 
	usersList
ìì 
.
ìì 
Any
ìì 
(
ìì 
)
ìì  
)
ìì  !
throw
îî 
new
îî #
UserNotFoundException
îî /
(
îî/ 0
$str
îî0 Y
)
îîY Z
;
îîZ [
return
ññ 
	usersList
ññ 
;
ññ 
}
óó 	
public
ôô 
async
ôô 
Task
ôô 
<
ôô 
IEnumerable
ôô %
<
ôô% &%
LastRegisteredSellerDTO
ôô& =
>
ôô= >
>
ôô> ?&
GetSellersLastMonthAsync
ôô@ X
(
ôôX Y
)
ôôY Z
{
öö 	
var
õõ 
	usersList
õõ 
=
õõ 
await
õõ !.
 SellerDetailsFromStoredProcAsync
õõ" B
(
õõB C
$str
õõC [
)
õõ[ \
;
õõ\ ]
if
ùù 
(
ùù 
!
ùù 
	usersList
ùù 
.
ùù 
Any
ùù 
(
ùù 
)
ùù  
)
ùù  !
throw
ûû 
new
ûû #
UserNotFoundException
ûû /
(
ûû/ 0
$str
ûû0 X
)
ûûX Y
;
ûûY Z
return
†† 
	usersList
†† 
;
†† 
}
°° 	
private
¢¢ 
async
¢¢ 
Task
¢¢ 
<
¢¢ 
IEnumerable
¢¢ &
<
¢¢& '%
LastRegisteredSellerDTO
¢¢' >
>
¢¢> ?
>
¢¢? @.
 SellerDetailsFromStoredProcAsync
¢¢A a
(
¢¢a b
string
¢¢b h
storedProcName
¢¢i w
)
¢¢w x
{
££ 	
var
§§ 

resultList
§§ 
=
§§ 
new
§§  
List
§§! %
<
§§% &%
LastRegisteredSellerDTO
§§& =
>
§§= >
(
§§> ?
)
§§? @
;
§§@ A
using
¶¶ 
(
¶¶ 
var
¶¶ 

connection
¶¶ !
=
¶¶" #
new
¶¶$ '
SqlConnection
¶¶( 5
(
¶¶5 6
_configuration
¶¶6 D
.
¶¶D E!
GetConnectionString
¶¶E X
(
¶¶X Y
$str
¶¶Y l
)
¶¶l m
)
¶¶m n
)
¶¶n o
{
ßß 
try
®® 
{
©© 
await
™™ 

connection
™™ $
.
™™$ %
	OpenAsync
™™% .
(
™™. /
)
™™/ 0
;
™™0 1
using
¨¨ 
(
¨¨ 
var
¨¨ 
command
¨¨ &
=
¨¨' (
new
¨¨) ,

SqlCommand
¨¨- 7
(
¨¨7 8
storedProcName
¨¨8 F
,
¨¨F G

connection
¨¨H R
)
¨¨R S
)
¨¨S T
{
≠≠ 
command
ÆÆ 
.
ÆÆ  
CommandType
ÆÆ  +
=
ÆÆ, -
CommandType
ÆÆ. 9
.
ÆÆ9 :
StoredProcedure
ÆÆ: I
;
ÆÆI J
using
∞∞ 
(
∞∞ 
var
∞∞ "
reader
∞∞# )
=
∞∞* +
await
∞∞, 1
command
∞∞2 9
.
∞∞9 : 
ExecuteReaderAsync
∞∞: L
(
∞∞L M
)
∞∞M N
)
∞∞N O
{
±± 
while
≤≤ !
(
≤≤" #
await
≤≤# (
reader
≤≤) /
.
≤≤/ 0
	ReadAsync
≤≤0 9
(
≤≤9 :
)
≤≤: ;
)
≤≤; <
{
≥≥ 

resultList
¥¥  *
.
¥¥* +
Add
¥¥+ .
(
¥¥. /
new
¥¥/ 2%
LastRegisteredSellerDTO
¥¥3 J
{
µµ  !
UserId
∂∂$ *
=
∂∂+ ,
reader
∂∂- 3
.
∂∂3 4
GetInt32
∂∂4 <
(
∂∂< =
reader
∂∂= C
.
∂∂C D

GetOrdinal
∂∂D N
(
∂∂N O
$str
∂∂O W
)
∂∂W X
)
∂∂X Y
,
∂∂Y Z
UserName
∑∑$ ,
=
∑∑- .
reader
∑∑/ 5
.
∑∑5 6
	GetString
∑∑6 ?
(
∑∑? @
reader
∑∑@ F
.
∑∑F G

GetOrdinal
∑∑G Q
(
∑∑Q R
$str
∑∑R \
)
∑∑\ ]
)
∑∑] ^
,
∑∑^ _
Email
∏∏$ )
=
∏∏* +
reader
∏∏, 2
.
∏∏2 3
	GetString
∏∏3 <
(
∏∏< =
reader
∏∏= C
.
∏∏C D

GetOrdinal
∏∏D N
(
∏∏N O
$str
∏∏O V
)
∏∏V W
)
∏∏W X
,
∏∏X Y
Role
ππ$ (
=
ππ) *
reader
ππ+ 1
.
ππ1 2
	GetString
ππ2 ;
(
ππ; <
reader
ππ< B
.
ππB C

GetOrdinal
ππC M
(
ππM N
$str
ππN T
)
ππT U
)
ππU V
,
ππV W
DateCreated
∫∫$ /
=
∫∫0 1
reader
∫∫2 8
.
∫∫8 9
GetDateTime
∫∫9 D
(
∫∫D E
reader
∫∫E K
.
∫∫K L

GetOrdinal
∫∫L V
(
∫∫V W
$str
∫∫W d
)
∫∫d e
)
∫∫e f
,
∫∫f g
IsActive
ªª$ ,
=
ªª- .
reader
ªª/ 5
.
ªª5 6

GetBoolean
ªª6 @
(
ªª@ A
reader
ªªA G
.
ªªG H

GetOrdinal
ªªH R
(
ªªR S
$str
ªªS ]
)
ªª] ^
)
ªª^ _
,
ªª_ `
SellerId
ºº$ ,
=
ºº- .
reader
ºº/ 5
.
ºº5 6
IsDBNull
ºº6 >
(
ºº> ?
reader
ºº? E
.
ººE F

GetOrdinal
ººF P
(
ººP Q
$str
ººQ [
)
ºº[ \
)
ºº\ ]
?
ºº^ _
default
ºº` g
:
ººh i
reader
ººj p
.
ººp q
GetInt32
ººq y
(
ººy z
readerººz Ä
.ººÄ Å

GetOrdinalººÅ ã
(ººã å
$strººå ñ
)ººñ ó
)ººó ò
,ººò ô
CompanyName
ΩΩ$ /
=
ΩΩ0 1
reader
ΩΩ2 8
.
ΩΩ8 9
IsDBNull
ΩΩ9 A
(
ΩΩA B
reader
ΩΩB H
.
ΩΩH I

GetOrdinal
ΩΩI S
(
ΩΩS T
$str
ΩΩT a
)
ΩΩa b
)
ΩΩb c
?
ΩΩd e
null
ΩΩf j
:
ΩΩk l
reader
ΩΩm s
.
ΩΩs t
	GetString
ΩΩt }
(
ΩΩ} ~
readerΩΩ~ Ñ
.ΩΩÑ Ö

GetOrdinalΩΩÖ è
(ΩΩè ê
$strΩΩê ù
)ΩΩù û
)ΩΩû ü
,ΩΩü †'
CompanyRegistrationNumber
ææ$ =
=
ææ> ?
reader
ææ@ F
.
ææF G
IsDBNull
ææG O
(
ææO P
reader
ææP V
.
ææV W

GetOrdinal
ææW a
(
ææa b
$str
ææb }
)
ææ} ~
)
ææ~ 
?ææÄ Å
nullææÇ Ü
:ææá à
readerææâ è
.ææè ê
	GetStringææê ô
(ææô ö
readerææö †
.ææ† °

GetOrdinalææ° ´
(ææ´ ¨
$strææ¨ «
)ææ« »
)ææ» …
,ææ…  
	GSTNumber
øø$ -
=
øø. /
reader
øø0 6
.
øø6 7
IsDBNull
øø7 ?
(
øø? @
reader
øø@ F
.
øøF G

GetOrdinal
øøG Q
(
øøQ R
$str
øøR ]
)
øø] ^
)
øø^ _
?
øø` a
null
øøb f
:
øøg h
reader
øøi o
.
øøo p
	GetString
øøp y
(
øøy z
readerøøz Ä
.øøÄ Å

GetOrdinaløøÅ ã
(øøã å
$strøøå ó
)øøó ò
)øøò ô
,øøô ö
BusinessType
¿¿$ 0
=
¿¿1 2
reader
¿¿3 9
.
¿¿9 :
IsDBNull
¿¿: B
(
¿¿B C
reader
¿¿C I
.
¿¿I J

GetOrdinal
¿¿J T
(
¿¿T U
$str
¿¿U c
)
¿¿c d
)
¿¿d e
?
¿¿f g
null
¿¿h l
:
¿¿m n
reader
¿¿o u
.
¿¿u v
	GetString
¿¿v 
(¿¿ Ä
reader¿¿Ä Ü
.¿¿Ü á

GetOrdinal¿¿á ë
(¿¿ë í
$str¿¿í †
)¿¿† °
)¿¿° ¢
,¿¿¢ £
}
¡¡  !
)
¡¡! "
;
¡¡" #
}
¬¬ 
}
√√ 
}
ƒƒ 
}
≈≈ 
catch
∆∆ 
(
∆∆ 
	Exception
∆∆  
ex
∆∆! #
)
∆∆# $
{
«« 
throw
»» 
new
»» !
DataAccessException
»» 1
(
»»1 2
$str
»»2 k
)
»»k l
;
»»l m
}
…… 
}
   
return
ÀÀ 

resultList
ÀÀ 
;
ÀÀ 
}
ÃÃ 	
public
ŒŒ 
async
ŒŒ 
Task
ŒŒ 
LogUserAction
ŒŒ '
(
ŒŒ' (
int
ŒŒ( +
userId
ŒŒ, 2
,
ŒŒ2 3
string
ŒŒ4 :
action
ŒŒ; A
,
ŒŒA B
string
ŒŒC I
tableAffected
ŒŒJ W
,
ŒŒW X
int
ŒŒY \
recordId
ŒŒ] e
,
ŒŒe f
string
ŒŒg m
details
ŒŒn u
)
ŒŒu v
{
œœ 	
var
–– 
sql
–– 
=
–– 
$str
–– d
;
––d e
await
““ 
_context
““ 
.
““ 
Database
““ #
.
““# $ 
ExecuteSqlRawAsync
““$ 6
(
““6 7
sql
”” 
,
”” 
new
‘‘ 
SqlParameter
‘‘  
(
‘‘  !
$str
‘‘! *
,
‘‘* +
userId
‘‘, 2
)
‘‘2 3
,
‘‘3 4
new
’’ 
SqlParameter
’’  
(
’’  !
$str
’’! *
,
’’* +
action
’’, 2
)
’’2 3
,
’’3 4
new
÷÷ 
SqlParameter
÷÷  
(
÷÷  !
$str
÷÷! 1
,
÷÷1 2
tableAffected
÷÷3 @
)
÷÷@ A
,
÷÷A B
new
◊◊ 
SqlParameter
◊◊  
(
◊◊  !
$str
◊◊! ,
,
◊◊, -
recordId
◊◊. 6
)
◊◊6 7
,
◊◊7 8
new
ÿÿ 
SqlParameter
ÿÿ  
(
ÿÿ  !
$str
ÿÿ! +
,
ÿÿ+ ,
details
ÿÿ- 4
)
ÿÿ4 5
)
ŸŸ 
;
ŸŸ 
}
⁄⁄ 	
public
‹‹ 
IEnumerable
‹‹ 
<
‹‹ 
Address
‹‹ "
>
‹‹" #"
GetAddressesByUserId
‹‹$ 8
(
‹‹8 9
int
‹‹9 <
userId
‹‹= C
)
‹‹C D
{
›› 	
return
ﬁﬁ 
_context
ﬁﬁ 
.
ﬁﬁ 
	Addresses
ﬁﬁ %
.
ﬂﬂ 
Where
ﬂﬂ 
(
ﬂﬂ 
a
ﬂﬂ 
=>
ﬂﬂ 
a
ﬂﬂ 
.
ﬂﬂ 
UserId
ﬂﬂ $
==
ﬂﬂ% '
userId
ﬂﬂ( .
)
ﬂﬂ. /
.
‡‡ 
ToList
‡‡ 
(
‡‡ 
)
‡‡ 
;
‡‡ 
}
·· 	
public
„„ 
async
„„ 
Task
„„ 
<
„„ 
	SellerDTO
„„ #
>
„„# $$
GetSellerByUserIdAsync
„„% ;
(
„„; <
int
„„< ?
userId
„„@ F
)
„„F G
{
‰‰ 	
var
ÂÂ 
seller
ÂÂ 
=
ÂÂ 
await
ÂÂ 
_context
ÂÂ '
.
ÂÂ' (
SellerDetails
ÂÂ( 5
.
ÊÊ 
Where
ÊÊ 
(
ÊÊ 
s
ÊÊ 
=>
ÊÊ 
s
ÊÊ 
.
ÊÊ 
UserId
ÊÊ $
==
ÊÊ% '
userId
ÊÊ( .
)
ÊÊ. /
.
ÁÁ 
Select
ÁÁ 
(
ÁÁ 
s
ÁÁ 
=>
ÁÁ 
new
ÁÁ  
	SellerDTO
ÁÁ! *
{
ËË 
SellerId
ÈÈ 
=
ÈÈ 
s
ÈÈ  
.
ÈÈ  !
SellerId
ÈÈ! )
,
ÈÈ) *
UserId
ÍÍ 
=
ÍÍ 
s
ÍÍ 
.
ÍÍ 
UserId
ÍÍ %
,
ÍÍ% &
CompanyName
ÎÎ 
=
ÎÎ  !
s
ÎÎ" #
.
ÎÎ# $
CompanyName
ÎÎ$ /
,
ÎÎ/ 0'
CompanyRegistrationNumber
ÏÏ -
=
ÏÏ. /
s
ÏÏ0 1
.
ÏÏ1 2'
CompanyRegistrationNumber
ÏÏ2 K
,
ÏÏK L
	GSTNumber
ÌÌ 
=
ÌÌ 
s
ÌÌ  !
.
ÌÌ! "
	GSTNumber
ÌÌ" +
,
ÌÌ+ ,
BusinessType
ÓÓ  
=
ÓÓ! "
s
ÓÓ# $
.
ÓÓ$ %
BusinessType
ÓÓ% 1
}
ÔÔ 
)
ÔÔ 
.
 !
FirstOrDefaultAsync
 $
(
$ %
)
% &
;
& '
return
ÚÚ 
seller
ÚÚ 
;
ÚÚ 
}
ÛÛ 	
public
ıı 
async
ıı 
Task
ıı 
<
ıı 
UserProfileDto
ıı (
>
ıı( )%
GetUserProfileByIdAsync
ıı* A
(
ııA B
int
ııB E
userId
ııF L
)
ııL M
{
ˆˆ 	
var
˜˜ 
user
˜˜ 
=
˜˜ 
await
˜˜ 
_context
˜˜ %
.
˜˜% &
Users
˜˜& +
.
¯¯ 
Include
¯¯ 
(
¯¯ 
u
¯¯ 
=>
¯¯ 
u
¯¯ 
.
¯¯  
PersonalDetails
¯¯  /
)
¯¯/ 0
.
˘˘ 
Include
˘˘ 
(
˘˘ 
u
˘˘ 
=>
˘˘ 
u
˘˘ 
.
˘˘  
Address
˘˘  '
)
˘˘' (
.
˙˙ 
Include
˙˙ 
(
˙˙ 
u
˙˙ 
=>
˙˙ 
u
˙˙ 
.
˙˙  
SellerDetails
˙˙  -
)
˙˙- .
.
˚˚ !
FirstOrDefaultAsync
˚˚ $
(
˚˚$ %
u
˚˚% &
=>
˚˚' )
u
˚˚* +
.
˚˚+ ,
UserId
˚˚, 2
==
˚˚3 5
userId
˚˚6 <
)
˚˚< =
;
˚˚= >
if
˝˝ 
(
˝˝ 
user
˝˝ 
==
˝˝ 
null
˝˝ 
)
˝˝ 
return
˝˝ $
null
˝˝% )
;
˝˝) *
return
ˇˇ 
new
ˇˇ 
UserProfileDto
ˇˇ %
{
ÄÄ 
UserId
ÅÅ 
=
ÅÅ 
user
ÅÅ 
.
ÅÅ 
UserId
ÅÅ $
,
ÅÅ$ %
Username
ÇÇ 
=
ÇÇ 
user
ÇÇ 
.
ÇÇ  
Username
ÇÇ  (
,
ÇÇ( )
Email
ÉÉ 
=
ÉÉ 
user
ÉÉ 
.
ÉÉ 
Email
ÉÉ "
,
ÉÉ" #
DateCreated
ÑÑ 
=
ÑÑ 
user
ÑÑ "
.
ÑÑ" #
DateCreated
ÑÑ# .
,
ÑÑ. /
PersonalDetails
ÖÖ 
=
ÖÖ  !
user
ÖÖ" &
.
ÖÖ& '
PersonalDetails
ÖÖ' 6
!=
ÖÖ7 9
null
ÖÖ: >
?
ÖÖ? @
new
ÖÖA D 
PersonalDetailsDto
ÖÖE W
{
ÜÜ 
PersonalDetailsId
áá %
=
áá& '
user
áá( ,
.
áá, -
PersonalDetails
áá- <
.
áá< =
PersonalDetailsId
áá= N
,
ááN O
	FirstName
àà 
=
àà 
user
àà  $
.
àà$ %
PersonalDetails
àà% 4
.
àà4 5
	FirstName
àà5 >
,
àà> ?
LastName
ââ 
=
ââ 
user
ââ #
.
ââ# $
PersonalDetails
ââ$ 3
.
ââ3 4
LastName
ââ4 <
,
ââ< =
Gender
ää 
=
ää 
user
ää !
.
ää! "
PersonalDetails
ää" 1
.
ää1 2
Gender
ää2 8
,
ää8 9
DateOfBirth
ãã 
=
ãã  !
user
ãã" &
.
ãã& '
PersonalDetails
ãã' 6
.
ãã6 7
DateOfBirth
ãã7 B
,
ããB C
PhoneNumber
åå 
=
åå  !
user
åå" &
.
åå& '
PersonalDetails
åå' 6
.
åå6 7
PhoneNumber
åå7 B
}
çç 
:
çç 
null
çç 
,
çç 
Address
éé 
=
éé 
user
éé 
.
éé 
Address
éé &
!=
éé' )
null
éé* .
?
éé/ 0
new
éé1 4

AddressDto
éé5 ?
{
èè 
	AddressId
êê 
=
êê 
user
êê  $
.
êê$ %
Address
êê% ,
.
êê, -
	AddressId
êê- 6
,
êê6 7
AddressLine1
ëë  
=
ëë! "
user
ëë# '
.
ëë' (
Address
ëë( /
.
ëë/ 0
AddressLine1
ëë0 <
,
ëë< =
AddressLine2
íí  
=
íí! "
user
íí# '
.
íí' (
Address
íí( /
.
íí/ 0
AddressLine2
íí0 <
,
íí< =
City
ìì 
=
ìì 
user
ìì 
.
ìì  
Address
ìì  '
.
ìì' (
City
ìì( ,
,
ìì, -
State
îî 
=
îî 
user
îî  
.
îî  !
Address
îî! (
.
îî( )
State
îî) .
,
îî. /

PostalCode
ïï 
=
ïï  
user
ïï! %
.
ïï% &
Address
ïï& -
.
ïï- .

PostalCode
ïï. 8
,
ïï8 9
Country
ññ 
=
ññ 
user
ññ "
.
ññ" #
Address
ññ# *
.
ññ* +
Country
ññ+ 2
}
óó 
:
óó 
null
óó 
,
óó 
}
òò 
;
òò 
}
ôô 	
public
õõ 
async
õõ 
Task
õõ $
UpdateUserProfileAsync
õõ 0
(
õõ0 1
UserProfileDto
õõ1 ?
userProfileDto
õõ@ N
)
õõN O
{
úú 	
var
ùù 
user
ùù 
=
ùù 
await
ùù 
_context
ùù %
.
ùù% &
Users
ùù& +
.
ûû 
Include
ûû 
(
ûû 
u
ûû 
=>
ûû 
u
ûû 
.
ûû  
PersonalDetails
ûû  /
)
ûû/ 0
.
üü 
Include
üü 
(
üü 
u
üü 
=>
üü 
u
üü 
.
üü  
Address
üü  '
)
üü' (
.
†† 
Include
†† 
(
†† 
u
†† 
=>
†† 
u
†† 
.
††  
SellerDetails
††  -
)
††- .
.
°° !
FirstOrDefaultAsync
°° $
(
°°$ %
u
°°% &
=>
°°' )
u
°°* +
.
°°+ ,
UserId
°°, 2
==
°°3 5
userProfileDto
°°6 D
.
°°D E
UserId
°°E K
)
°°K L
;
°°L M
if
££ 
(
££ 
user
££ 
!=
££ 
null
££ 
)
££ 
{
§§ 
user
•• 
.
•• 
Email
•• 
=
•• 
userProfileDto
•• +
.
••+ ,
Email
••, 1
;
••1 2
user
¶¶ 
.
¶¶ 
PersonalDetails
¶¶ $
.
¶¶$ %
	FirstName
¶¶% .
=
¶¶/ 0
userProfileDto
¶¶1 ?
.
¶¶? @
PersonalDetails
¶¶@ O
.
¶¶O P
	FirstName
¶¶P Y
;
¶¶Y Z
user
ßß 
.
ßß 
PersonalDetails
ßß $
.
ßß$ %
LastName
ßß% -
=
ßß. /
userProfileDto
ßß0 >
.
ßß> ?
PersonalDetails
ßß? N
.
ßßN O
LastName
ßßO W
;
ßßW X
user
®® 
.
®® 
PersonalDetails
®® $
.
®®$ %
PhoneNumber
®®% 0
=
®®1 2
userProfileDto
®®3 A
.
®®A B
PersonalDetails
®®B Q
.
®®Q R
PhoneNumber
®®R ]
;
®®] ^
user
©© 
.
©© 
Address
©© 
.
©© 
AddressLine1
©© )
=
©©* +
userProfileDto
©©, :
.
©©: ;
Address
©©; B
.
©©B C
AddressLine1
©©C O
;
©©O P
user
™™ 
.
™™ 
Address
™™ 
.
™™ 
AddressLine2
™™ )
=
™™* +
userProfileDto
™™, :
.
™™: ;
Address
™™; B
.
™™B C
AddressLine2
™™C O
;
™™O P
user
´´ 
.
´´ 
Address
´´ 
.
´´ 
City
´´ !
=
´´" #
userProfileDto
´´$ 2
.
´´2 3
Address
´´3 :
.
´´: ;
City
´´; ?
;
´´? @
user
¨¨ 
.
¨¨ 
Address
¨¨ 
.
¨¨ 
State
¨¨ "
=
¨¨# $
userProfileDto
¨¨% 3
.
¨¨3 4
Address
¨¨4 ;
.
¨¨; <
State
¨¨< A
;
¨¨A B
user
≠≠ 
.
≠≠ 
Address
≠≠ 
.
≠≠ 

PostalCode
≠≠ '
=
≠≠( )
userProfileDto
≠≠* 8
.
≠≠8 9
Address
≠≠9 @
.
≠≠@ A

PostalCode
≠≠A K
;
≠≠K L
user
ÆÆ 
.
ÆÆ 
Address
ÆÆ 
.
ÆÆ 
Country
ÆÆ $
=
ÆÆ% &
userProfileDto
ÆÆ' 5
.
ÆÆ5 6
Address
ÆÆ6 =
.
ÆÆ= >
Country
ÆÆ> E
;
ÆÆE F
await
∞∞ 
_context
∞∞ 
.
∞∞ 
SaveChangesAsync
∞∞ /
(
∞∞/ 0
)
∞∞0 1
;
∞∞1 2
}
±± 
}
≤≤ 	
}
≥≥ 
}¥¥ Õ(
rD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\UserRepository\IUserRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
UserRepository +
{ 
public 

	interface 
IUserRepository $
{		 
Task

 
<

 
User

 
>

 
GetUserById

 
(

 
int

 "
userId

# )
)

) *
;

* +
Task 
< 
IEnumerable 
< 

GetUserDTO #
># $
>$ %
GetAllUsersAsync& 6
(6 7
)7 8
;8 9
Task 
< 

GetUserDTO 
> 
GetUserByIdAsync )
() *
int* -
userId. 4
)4 5
;5 6
Task 
< 

GetUserDTO 
> "
GetUserByUsernameAsync /
(/ 0
string0 6
username7 ?
)? @
;@ A
Task 
< 

GetUserDTO 
> 
GetUserByEmailAsync ,
(, -
string- 3
email4 9
)9 :
;: ;
Task 
< 
User 
> )
GetUserByEmailOrUsernameAsync 0
(0 1
string1 7
emailOrUsername8 G
)G H
;H I
Task 
< 
SellerDetails 
> )
GetSellerDetailsByUserIdAsync 9
(9 :
int: =
userId> D
)D E
;E F
Task 
< 
int 
> 
AddUserAsync 
( 
User #
user$ (
)( )
;) *
Task !
AddSellerDetailsAsync "
(" #
SellerDetails# 0
sellerDetails1 >
)> ?
;? @
Task 
UpdateUserAsync 
( 
UserDTO $
userDto% ,
,, -
int. 1
userId2 8
)8 9
;9 :
Task 
UpdateUserAsync 
( 
User !
user" &
)& '
;' (
Task &
UpdatePersonalDetailsAsync '
(' (
PersonalDetails( 7
updatedDetails8 F
)F G
;G H
Task $
UpdateSellerDetailsAsync %
(% &
User& * 
updatedSellerDetails+ ?
)? @
;@ A
Task 
DeleteUserAsync 
( 
int  
userId! '
)' (
;( )
Task 
LogUserAction 
( 
int 
userId %
,% &
string' -
action. 4
,4 5
string6 <
tableAffected= J
,J K
intL O
recordIdP X
,X Y
stringZ `
detailsa h
)h i
;i j
Task 
< 
IEnumerable 
< 
LastRegisteredDTO *
>* +
>+ ,$
GetUsersLast24HoursAsync- E
(E F
)F G
;G H
Task 
< 
IEnumerable 
< 
LastRegisteredDTO *
>* +
>+ ,"
GetUsersLast7DaysAsync- C
(C D
)D E
;E F
Task 
< 
IEnumerable 
< 
LastRegisteredDTO *
>* +
>+ ,"
GetUsersLastMonthAsync- C
(C D
)D E
;E F
Task   
<   
IEnumerable   
<   #
LastRegisteredSellerDTO   0
>  0 1
>  1 2&
GetSellersLast24HoursAsync  3 M
(  M N
)  N O
;  O P
Task!! 
<!! 
IEnumerable!! 
<!! #
LastRegisteredSellerDTO!! 0
>!!0 1
>!!1 2$
GetSellersLast7DaysAsync!!3 K
(!!K L
)!!L M
;!!M N
Task"" 
<"" 
IEnumerable"" 
<"" #
LastRegisteredSellerDTO"" 0
>""0 1
>""1 2$
GetSellersLastMonthAsync""3 K
(""K L
)""L M
;""M N
IEnumerable$$ 
<$$ 
Address$$ 
>$$  
GetAddressesByUserId$$ 1
($$1 2
int$$2 5
userId$$6 <
)$$< =
;$$= >
Task&& 
<&& 
	SellerDTO&& 
>&& "
GetSellerByUserIdAsync&& .
(&&. /
int&&/ 2
userId&&3 9
)&&9 :
;&&: ;
Task(( 
<(( 
UserProfileDto(( 
>(( #
GetUserProfileByIdAsync(( 4
(((4 5
int((5 8
userId((9 ?
)((? @
;((@ A
Task)) "
UpdateUserProfileAsync)) #
())# $
UserProfileDto))$ 2
userProfileDto))3 A
)))A B
;))B C
}** 
}++ ª\
|D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\ReviewRepository\ProductReviewRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
ReviewRepository -
{ 
public 

class #
ProductReviewRepository (
:) *$
IProductReviewRepository+ C
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public #
ProductReviewRepository &
(& '
AppDbContext' 3
context4 ;
); <
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
int 
> 
AddReviewAsync -
(- .
	ReviewDTO. 7
	reviewDto8 A
)A B
{ 	
var 
review 
= 
new 
ProductReview *
{ 
	ProductId 
= 
	reviewDto %
.% &
	ProductId& /
,/ 0
UserId 
= 
	reviewDto "
." #
UserId# )
,) *
Rating 
= 
	reviewDto "
." #
Rating# )
,) *
Comment 
= 
	reviewDto #
.# $
Comment$ +
,+ ,

ReviewDate   
=   
DateTime   %
.  % &
Now  & )
}!! 
;!! 
_context## 
.## 
ProductReviews## #
.### $
Add##$ '
(##' (
review##( .
)##. /
;##/ 0
await$$ 
_context$$ 
.$$ 
SaveChangesAsync$$ +
($$+ ,
)$$, -
;$$- .
return&& 
review&& 
.&& 
ReviewId&& "
;&&" #
}'' 	
public)) 
async)) 
Task)) 
<)) 
ReviewResponseDTO)) +
>))+ ,
GetReviewByIdAsync))- ?
())? @
int))@ C
reviewId))D L
)))L M
{** 	
var++ 
review++ 
=++ 
await++ 
_context++ '
.++' (
ProductReviews++( 6
.,, 
Include,, 
(,, 
r,, 
=>,, 
r,, 
.,,  
Product,,  '
),,' (
.-- 
Include-- 
(-- 
r-- 
=>-- 
r-- 
.--  
User--  $
)--$ %
... 
FirstOrDefaultAsync.. $
(..$ %
r..% &
=>..' )
r..* +
...+ ,
ReviewId.., 4
==..5 7
reviewId..8 @
)..@ A
;..A B
if00 
(00 
review00 
==00 
null00 
)00 
throw00  %
new00& )#
ReviewNotFoundException00* A
(00A B
$"00B D
$str00D ]
{00] ^
reviewId00^ f
}00f g
"00g h
)00h i
;00i j
return22 
new22 
ReviewResponseDTO22 (
{33 
ReviewId44 
=44 
review44 !
.44! "
ReviewId44" *
,44* +
	ProductId55 
=55 
review55 "
.55" #
	ProductId55# ,
,55, -
UserId66 
=66 
review66 
.66  
UserId66  &
,66& '
ProductName77 
=77 
review77 $
.77$ %
Product77% ,
.77, -
ProductName77- 8
,778 9
Username88 
=88 
review88 !
.88! "
User88" &
.88& '
Username88' /
,88/ 0
Rating99 
=99 
review99 
.99  
Rating99  &
,99& '
Comment:: 
=:: 
review::  
.::  !
Comment::! (
,::( )

ReviewDate;; 
=;; 
review;; #
.;;# $

ReviewDate;;$ .
}<< 
;<< 
}== 	
public?? 
async?? 
Task?? 
<?? 
IEnumerable?? %
<??% &
ReviewResponseDTO??& 7
>??7 8
>??8 9&
GetReviewsByProductIdAsync??: T
(??T U
int??U X
	productId??Y b
)??b c
{@@ 	
varAA 
productAA 
=AA 
_contextAA "
.AA" #
ProductsAA# +
.AA+ ,
FirstOrDefaultAA, :
(AA: ;
pAA; <
=>AA= ?
pAA@ A
.AAA B
	ProductIdAAB K
==AAL N
	productIdAAO X
)AAX Y
;AAY Z
ifBB 
(BB 
productBB 
==BB 
nullBB 
)BB  
throwBB! &
newBB' *$
ProductNotFoundExceptionBB+ C
(BBC D
$"BBD F
$strBBF c
{BBc d
	productIdBBd m
}BBm n
$strBBn o
"BBo p
)BBp q
;BBq r
;BBs t
varDD 
reviewsDD 
=DD 
awaitDD 
_contextDD  (
.DD( )
ProductReviewsDD) 7
.EE 
WhereEE 
(EE 
rEE 
=>EE 
rEE 
.EE 
	ProductIdEE '
==EE( *
	productIdEE+ 4
)EE4 5
.FF 
IncludeFF 
(FF 
rFF 
=>FF 
rFF 
.FF  
UserFF  $
)FF$ %
.GG 
SelectGG 
(GG 
rGG 
=>GG 
newGG  
ReviewResponseDTOGG! 2
{HH 
ReviewIdII 
=II 
rII  
.II  !
ReviewIdII! )
,II) *
	ProductIdJJ 
=JJ 
rJJ  !
.JJ! "
	ProductIdJJ" +
,JJ+ ,
ProductNameKK 
=KK  !
productKK" )
.KK) *
ProductNameKK* 5
,KK5 6
UserIdLL 
=LL 
rLL 
.LL 
UserIdLL %
,LL% &
UsernameMM 
=MM 
rMM  
.MM  !
UserMM! %
.MM% &
UsernameMM& .
,MM. /
RatingNN 
=NN 
rNN 
.NN 
RatingNN %
,NN% &
CommentOO 
=OO 
rOO 
.OO  
CommentOO  '
,OO' (

ReviewDatePP 
=PP  
rPP! "
.PP" #

ReviewDatePP# -
}QQ 
)QQ 
.QQ 
ToListAsyncQQ 
(QQ 
)QQ  
;QQ  !
returnSS 
reviewsSS 
;SS 
}TT 	
publicVV 
asyncVV 
TaskVV 
<VV 
IEnumerableVV %
<VV% &
ReviewResponseDTOVV& 7
>VV7 8
>VV8 9#
GetReviewsByUserIdAsyncVV: Q
(VVQ R
intVVR U
userIdVVV \
)VV\ ]
{WW 	
varXX 
userXX 
=XX 
_contextXX 
.XX  
UsersXX  %
.XX% &
FirstOrDefaultXX& 4
(XX4 5
uXX5 6
=>XX7 9
uXX: ;
.XX; <
UserIdXX< B
==XXC E
userIdXXF L
)XXL M
;XXM N
ifYY 
(YY 
userYY 
==YY 
nullYY 
)YY 
throwYY #
newYY$ '!
UserNotFoundExceptionYY( =
(YY= >
$strYY> N
)YYN O
;YYO P
var[[ 
reviews[[ 
=[[ 
await[[ 
_context[[  (
.[[( )
ProductReviews[[) 7
.\\ 
Where\\ 
(\\ 
r\\ 
=>\\ 
r\\ 
.\\ 
UserId\\ $
==\\% '
userId\\( .
)\\. /
.]] 
Include]] 
(]] 
r]] 
=>]] 
r]] 
.]]  
Product]]  '
)]]' (
.^^ 
Select^^ 
(^^ 
r^^ 
=>^^ 
new^^  
ReviewResponseDTO^^! 2
{__ 
ReviewId`` 
=`` 
r``  
.``  !
ReviewId``! )
,``) *
	ProductIdaa 
=aa 
raa  !
.aa! "
	ProductIdaa" +
,aa+ ,
ProductNamebb 
=bb  !
rbb" #
.bb# $
Productbb$ +
.bb+ ,
ProductNamebb, 7
,bb7 8
Usernamecc 
=cc 
usercc #
.cc# $
Usernamecc$ ,
,cc, -
Ratingdd 
=dd 
rdd 
.dd 
Ratingdd %
,dd% &
Commentee 
=ee 
ree 
.ee  
Commentee  '
,ee' (

ReviewDateff 
=ff  
rff! "
.ff" #

ReviewDateff# -
}gg 
)gg 
.gg 
ToListAsyncgg 
(gg 
)gg  
;gg  !
returnii 
reviewsii 
;ii 
}jj 	
publicll 
asyncll 
Taskll 
<ll 
boolll 
>ll 
UpdateReviewAsyncll  1
(ll1 2
intll2 5
reviewIdll6 >
,ll> ?
	ReviewDTOll@ I
	reviewDtollJ S
)llS T
{mm 	
varnn 
reviewnn 
=nn 
awaitnn 
_contextnn '
.nn' (
ProductReviewsnn( 6
.nn6 7
	FindAsyncnn7 @
(nn@ A
reviewIdnnA I
)nnI J
;nnJ K
ifoo 
(oo 
reviewoo 
==oo 
nulloo 
)oo 
throwoo  %
newoo& )#
ReviewNotFoundExceptionoo* A
(ooA B
$"ooB D
$strooD ]
{oo] ^
reviewIdoo^ f
}oof g
"oog h
)ooh i
;ooi j
reviewqq 
.qq 
Ratingqq 
=qq 
	reviewDtoqq %
.qq% &
Ratingqq& ,
;qq, -
reviewrr 
.rr 
Commentrr 
=rr 
	reviewDtorr &
.rr& '
Commentrr' .
;rr. /
awaitss 
_contextss 
.ss 
SaveChangesAsyncss +
(ss+ ,
)ss, -
;ss- .
returnuu 
trueuu 
;uu 
}vv 	
publicxx 
asyncxx 
Taskxx 
<xx 
boolxx 
>xx 
DeleteReviewAsyncxx  1
(xx1 2
intxx2 5
reviewIdxx6 >
)xx> ?
{yy 	
varzz 
reviewzz 
=zz 
awaitzz 
_contextzz '
.zz' (
ProductReviewszz( 6
.zz6 7
	FindAsynczz7 @
(zz@ A
reviewIdzzA I
)zzI J
;zzJ K
if{{ 
({{ 
review{{ 
=={{ 
null{{ 
){{ 
throw{{  %
new{{& )#
ReviewNotFoundException{{* A
({{A B
$"{{B D
$str{{D ]
{{{] ^
reviewId{{^ f
}{{f g
"{{g h
){{h i
;{{i j
_context}} 
.}} 
ProductReviews}} #
.}}# $
Remove}}$ *
(}}* +
review}}+ 1
)}}1 2
;}}2 3
await~~ 
_context~~ 
.~~ 
SaveChangesAsync~~ +
(~~+ ,
)~~, -
;~~- .
return
ÄÄ 
true
ÄÄ 
;
ÄÄ 
}
ÅÅ 	
}
ÇÇ 
}ÑÑ ®
}D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\ReviewRepository\IProductReviewRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
ReviewRepository -
{		 
public

 

	interface

 $
IProductReviewRepository

 -
{ 
Task 
< 
int 
> 
AddReviewAsync  
(  !
	ReviewDTO! *
	reviewDto+ 4
)4 5
;5 6
Task 
< 
ReviewResponseDTO 
> 
GetReviewByIdAsync  2
(2 3
int3 6
reviewId7 ?
)? @
;@ A
Task 
< 
IEnumerable 
< 
ReviewResponseDTO *
>* +
>+ ,&
GetReviewsByProductIdAsync- G
(G H
intH K
	productIdL U
)U V
;V W
Task 
< 
IEnumerable 
< 
ReviewResponseDTO *
>* +
>+ ,#
GetReviewsByUserIdAsync- D
(D E
intE H
userIdI O
)O P
;P Q
Task 
< 
bool 
> 
UpdateReviewAsync $
($ %
int% (
reviewId) 1
,1 2
	ReviewDTO3 <
	reviewDto= F
)F G
;G H
Task 
< 
bool 
> 
DeleteReviewAsync $
($ %
int% (
reviewId) 1
)1 2
;2 3
} 
} ≤ö
wD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\ProductRepository\ProductRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
ProductRepository .
{ 
public 

class 
ProductRepository "
:# $
IProductRepository% 7
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public 
ProductRepository  
(  !
AppDbContext! -
context. 5
)5 6
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Product& -
>- .
>. /
GetAllProductsAsync0 C
(C D
)D E
{ 	
return 
await 
_context !
.! "
Products" *
.* +
Include+ 2
(2 3
p3 4
=>5 7
p8 9
.9 :
	Inventory: C
)C D
.* +
Include+ 2
(2 3
p3 4
=>5 7
p8 9
.9 :
Brand: ?
)? @
.* +
Include+ 2
(2 3
p3 4
=>5 7
p8 9
.9 :
SubCategory: E
)E F
.* +
ToListAsync+ 6
(6 7
)7 8
;8 9
}   	
public"" 
async"" 
Task"" 
<"" 
Product"" !
>""! "
GetProductByIdAsync""# 6
(""6 7
int""7 :
	productId""; D
)""D E
{## 	
var$$ 
product$$ 
=$$ 
await$$ 
_context$$  (
.$$( )
Products$$) 1
.%%( )
Include%%) 0
(%%0 1
p%%1 2
=>%%3 5
p%%6 7
.%%7 8
	Inventory%%8 A
)%%A B
.&&( )
FirstOrDefaultAsync&&) <
(&&< =
p&&= >
=>&&? A
p&&B C
.&&C D
	ProductId&&D M
==&&N P
	productId&&Q Z
)&&Z [
;&&[ \
if(( 
((( 
product(( 
==(( 
null(( 
)((  
throw)) 
new)) $
ProductNotFoundException)) 2
())2 3
$str))3 J
)))J K
;))K L
return++ 
product++ 
;++ 
},, 	
public.. 
async.. 
Task.. 
<.. 
IEnumerable.. %
<..% &
Product..& -
>..- .
>... /"
GetProductsByNameAsync..0 F
(..F G
string..G M
productName..N Y
)..Y Z
{// 	
var00 
products00 
=00 
await00  
_context00! )
.00) *
Products00* 2
.11) *
Include11* 1
(111 2
p112 3
=>114 6
p117 8
.118 9
	Inventory119 B
)11B C
.22) *
Where22* /
(22/ 0
p220 1
=>222 4
p225 6
.226 7
ProductName227 B
.22B C
Contains22C K
(22K L
productName22L W
)22W X
)22X Y
.33) *
ToListAsync33* 5
(335 6
)336 7
;337 8
if55 
(55 
!55 
products55 
.55 
Any55 
(55 
)55 
)55  
throw66 
new66 $
ProductNotFoundException66 2
(662 3
productName663 >
)66> ?
;66? @
return88 
products88 
;88 
}99 	
public;; 
async;; 
Task;; 
<;; 
int;; 
>;; 
AddProductAsync;; .
(;;. /
Product;;/ 6
product;;7 >
,;;> ?
	Inventory;;@ I
	inventory;;J S
);;S T
{<< 	
_context== 
.== 
Products== 
.== 
Add== !
(==! "
product==" )
)==) *
;==* +
await>> 
_context>> 
.>> 
SaveChangesAsync>> +
(>>+ ,
)>>, -
;>>- .
	inventoryAA 
.AA 
	ProductIdAA 
=AA  !
productAA" )
.AA) *
	ProductIdAA* 3
;AA3 4
_contextBB 
.BB 
InventoriesBB  
.BB  !
AddBB! $
(BB$ %
	inventoryBB% .
)BB. /
;BB/ 0
awaitDD 
_contextDD 
.DD 
SaveChangesAsyncDD +
(DD+ ,
)DD, -
;DD- .
returnEE 
productEE 
.EE 
	ProductIdEE $
;EE$ %
}FF 	
publicHH 
asyncHH 
TaskHH 
UpdateProductAsyncHH ,
(HH, -
ProductHH- 4
productHH5 <
,HH< =
	InventoryHH> G
updatedInventoryHHH X
)HHX Y
{II 	
varJJ 
existingProductJJ 
=JJ  !
awaitJJ" '
GetProductByIdAsyncJJ( ;
(JJ; <
productJJ< C
.JJC D
	ProductIdJJD M
)JJM N
;JJN O
ifLL 
(LL 
existingProductLL 
==LL  "
nullLL# '
)LL' (
throwMM 
newMM $
ProductNotFoundExceptionMM 2
(MM2 3
$strMM3 J
)MMJ K
;MMK L
existingProductPP 
.PP 
ProductNamePP '
=PP( )
productPP* 1
.PP1 2
ProductNamePP2 =
;PP= >
existingProductQQ 
.QQ 
DescriptionQQ '
=QQ( )
productQQ* 1
.QQ1 2
DescriptionQQ2 =
;QQ= >
existingProductRR 
.RR 
PriceRR !
=RR" #
productRR$ +
.RR+ ,
PriceRR, 1
;RR1 2
existingProductSS 
.SS 
StockQuantitySS )
=SS* +
productSS, 3
.SS3 4
StockQuantitySS4 A
;SSA B
existingProductTT 
.TT 
ImageUrlTT $
=TT% &
productTT' .
.TT. /
ImageUrlTT/ 7
;TT7 8
existingProductUU 
.UU 
BrandIdUU #
=UU$ %
productUU& -
.UU- .
BrandIdUU. 5
;UU5 6
existingProductVV 
.VV 
SubCategoryIdVV )
=VV* +
productVV, 3
.VV3 4
SubCategoryIdVV4 A
;VVA B
existingProductWW 
.WW 
IsActiveWW $
=WW% &
productWW' .
.WW. /
IsActiveWW/ 7
;WW7 8
existingProductXX 
.XX 
	DateAddedXX %
=XX& '
productXX( /
.XX/ 0
	DateAddedXX0 9
;XX9 :
existingProduct[[ 
.[[ 
	Inventory[[ %
.[[% &
QuantityInStock[[& 5
=[[6 7
updatedInventory[[8 H
.[[H I
QuantityInStock[[I X
;[[X Y
existingProduct\\ 
.\\ 
	Inventory\\ %
.\\% &
ReorderLevel\\& 2
=\\3 4
updatedInventory\\5 E
.\\E F
ReorderLevel\\F R
;\\R S
await^^ 
_context^^ 
.^^ 
SaveChangesAsync^^ +
(^^+ ,
)^^, -
;^^- .
}__ 	
publicaa 
asyncaa 
Taskaa 
DeleteProductAsyncaa ,
(aa, -
intaa- 0
	productIdaa1 :
)aa: ;
{bb 	
varcc 
productcc 
=cc 
awaitcc 
GetProductByIdAsynccc  3
(cc3 4
	productIdcc4 =
)cc= >
;cc> ?
ifdd 
(dd 
productdd 
==dd 
nulldd 
)dd  
throwee 
newee $
ProductNotFoundExceptionee 2
(ee2 3
$stree3 U
)eeU V
;eeV W
_contextgg 
.gg 
Productsgg 
.gg 
Removegg $
(gg$ %
productgg% ,
)gg, -
;gg- .
_contexthh 
.hh 
Inventorieshh  
.hh  !
Removehh! '
(hh' (
producthh( /
.hh/ 0
	Inventoryhh0 9
)hh9 :
;hh: ;
awaitjj 
_contextjj 
.jj 
SaveChangesAsyncjj +
(jj+ ,
)jj, -
;jj- .
}kk 	
publicmm 
asyncmm 
Taskmm 
<mm 
IEnumerablemm %
<mm% & 
ProductWithSellerDTOmm& :
>mm: ;
>mm; <*
GetAllProductsWithSellersAsyncmm= [
(mm[ \
)mm\ ]
{nn 	
returnoo 
awaitoo 
(oo 
fromoo 
productoo &
inoo' )
_contextoo* 2
.oo2 3
Productsoo3 ;
joinpp 
sellerpp %
inpp& (
_contextpp) 1
.pp1 2
SellerDetailspp2 ?
onpp@ B
productppC J
.ppJ K
SellerIdppK S
equalsppT Z
sellerpp[ a
.ppa b
SellerIdppb j
selectqq  
newqq! $ 
ProductWithSellerDTOqq% 9
{rr 
	ProductIdss '
=ss( )
productss* 1
.ss1 2
	ProductIdss2 ;
,ss; <
ProductNamett )
=tt* +
producttt, 3
.tt3 4
ProductNamett4 ?
,tt? @
Descriptionuu )
=uu* +
productuu, 3
.uu3 4
Descriptionuu4 ?
,uu? @
Pricevv #
=vv$ %
productvv& -
.vv- .
Pricevv. 3
,vv3 4
StockQuantityww +
=ww, -
productww. 5
.ww5 6
StockQuantityww6 C
,wwC D
ImageUrlxx &
=xx' (
productxx) 0
.xx0 1
ImageUrlxx1 9
,xx9 :
	DateAddedyy '
=yy( )
productyy* 1
.yy1 2
	DateAddedyy2 ;
,yy; <
IsActivezz &
=zz' (
productzz) 0
.zz0 1
IsActivezz1 9
,zz9 :
BrandId{{ %
={{& '
product{{( /
.{{/ 0
BrandId{{0 7
,{{7 8
SubCategoryId|| +
=||, -
product||. 5
.||5 6
SubCategoryId||6 C
,||C D
SellerId}} &
=}}' (
seller}}) /
.}}/ 0
SellerId}}0 8
,}}8 9
CompanyName~~ )
=~~* +
seller~~, 2
.~~2 3
CompanyName~~3 >
,~~> ?
} 
) 
. 
ToListAsync (
(( )
)) *
;* +
}
ÄÄ 	
public
ÇÇ 
async
ÇÇ 
Task
ÇÇ (
UpdateProductQuantityAsync
ÇÇ 4
(
ÇÇ4 5
int
ÇÇ5 8
	productId
ÇÇ9 B
,
ÇÇB C
int
ÇÇD G
quantity
ÇÇH P
)
ÇÇP Q
{
ÉÉ 	
var
ÑÑ 
product
ÑÑ 
=
ÑÑ 
await
ÑÑ !
GetProductByIdAsync
ÑÑ  3
(
ÑÑ3 4
	productId
ÑÑ4 =
)
ÑÑ= >
;
ÑÑ> ?
if
ÖÖ 
(
ÖÖ 
product
ÖÖ 
!=
ÖÖ 
null
ÖÖ 
)
ÖÖ  
{
ÜÜ 
product
áá 
.
áá 
StockQuantity
áá %
+=
áá& (
quantity
áá) 1
;
áá1 2
product
àà 
.
àà 
	Inventory
àà !
.
àà! "
QuantityInStock
àà" 1
=
àà2 3
product
àà4 ;
.
àà; <
StockQuantity
àà< I
;
ààI J
await
ââ 
_context
ââ 
.
ââ 
SaveChangesAsync
ââ /
(
ââ/ 0
)
ââ0 1
;
ââ1 2
}
ää 
}
ãã 	
public
åå 
async
åå 
Task
åå 
<
åå 
IEnumerable
åå %
<
åå% &
SellerProductDTO
åå& 6
>
åå6 7
>
åå7 8(
GetProductsBySellerIdAsync
åå9 S
(
ååS T
int
ååT W
sellerId
ååX `
)
åå` a
{
çç 	
return
éé 
await
éé 
_context
éé !
.
éé! "
Products
éé" *
.
èè 
Where
èè 
(
èè 
p
èè 
=>
èè 
p
èè 
.
èè 
SellerId
èè &
==
èè' )
sellerId
èè* 2
)
èè2 3
.
êê 
Include
êê 
(
êê 
p
êê 
=>
êê 
p
êê 
.
êê  
Brand
êê  %
)
êê% &
.
ëë 
Include
ëë 
(
ëë 
p
ëë 
=>
ëë 
p
ëë 
.
ëë  
	Inventory
ëë  )
)
ëë) *
.
íí 
Select
íí 
(
íí 
p
íí 
=>
íí 
new
íí  
SellerProductDTO
íí! 1
{
ìì 
	ProductId
îî 
=
îî 
p
îî  !
.
îî! "
	ProductId
îî" +
,
îî+ ,
Name
ïï 
=
ïï 
p
ïï 
.
ïï 
ProductName
ïï (
,
ïï( )
SellerId
ññ 
=
ññ 
p
ññ  
.
ññ  !
SellerId
ññ! )
,
ññ) *
Description
óó 
=
óó  !
p
óó" #
.
óó# $
Description
óó$ /
,
óó/ 0
Price
òò 
=
òò 
p
òò 
.
òò 
Price
òò #
,
òò# $
StockQuantity
ôô !
=
ôô" #
p
ôô$ %
.
ôô% &
StockQuantity
ôô& 3
,
ôô3 4
ImageUrl
öö 
=
öö 
p
öö  
.
öö  !
ImageUrl
öö! )
,
öö) *
SubCategoryId
õõ !
=
õõ" #
p
õõ$ %
.
õõ% &
SubCategoryId
õõ& 3
,
õõ3 4
BrandId
úú 
=
úú 
p
úú 
.
úú  
BrandId
úú  '
,
úú' (
	BrandName
ùù 
=
ùù 
p
ùù  !
.
ùù! "
Brand
ùù" '
.
ùù' (
	BrandName
ùù( 1
,
ùù1 2
IsActive
ûû 
=
ûû 
p
ûû  
.
ûû  !
IsActive
ûû! )
,
ûû) *
RestockLevel
üü  
=
üü! "
p
üü# $
.
üü$ %
	Inventory
üü% .
.
üü. /
ReorderLevel
üü/ ;
,
üü; <
LastRestocked
†† !
=
††" #
p
††$ %
.
††% &
	Inventory
††& /
.
††/ 0
LastRestockedDate
††0 A
}
°° 
)
°° 
.
¢¢ 
ToListAsync
¢¢ 
(
¢¢ 
)
¢¢ 
;
¢¢ 
}
££ 	
public
•• 
async
•• 
Task
•• 
<
•• 
ProductDetailsDTO
•• +
>
••+ ,#
GetProductDetailsFull
••- B
(
••B C
int
••C F
	productId
••G P
)
••P Q
{
¶¶ 	
var
ßß 
product
ßß 
=
ßß 
await
ßß 
_context
ßß  (
.
ßß( )
Products
ßß) 1
.
®® 
Include
®® 
(
®® 
p
®® 
=>
®® 
p
®® 
.
®®  
Brand
®®  %
)
®®% &
.
©© 
Include
©© 
(
©© 
p
©© 
=>
©© 
p
©© 
.
©©  
	Inventory
©©  )
)
©©) *
.
™™ 
Include
™™ 
(
™™ 
p
™™ 
=>
™™ 
p
™™ 
.
™™  
ProductReviews
™™  .
)
™™. /
.
´´ 
ThenInclude
´´ 
(
´´ 
r
´´ 
=>
´´ !
r
´´" #
.
´´# $
User
´´$ (
)
´´( )
.
¨¨ !
FirstOrDefaultAsync
¨¨ $
(
¨¨$ %
p
¨¨% &
=>
¨¨' )
p
¨¨* +
.
¨¨+ ,
	ProductId
¨¨, 5
==
¨¨6 8
	productId
¨¨9 B
)
¨¨B C
;
¨¨C D
if
ÆÆ 
(
ÆÆ 
product
ÆÆ 
==
ÆÆ 
null
ÆÆ 
)
ÆÆ  
return
ÆÆ! '
null
ÆÆ( ,
;
ÆÆ, -
var
∞∞ 
productDetailsDto
∞∞ !
=
∞∞" #
new
∞∞$ '
ProductDetailsDTO
∞∞( 9
{
±± 
	ProductId
≤≤ 
=
≤≤ 
product
≤≤ #
.
≤≤# $
	ProductId
≤≤$ -
,
≤≤- .
ProductName
≥≥ 
=
≥≥ 
product
≥≥ %
.
≥≥% &
ProductName
≥≥& 1
,
≥≥1 2
	BrandName
¥¥ 
=
¥¥ 
product
¥¥ #
.
¥¥# $
Brand
¥¥$ )
?
¥¥) *
.
¥¥* +
	BrandName
¥¥+ 4
??
¥¥5 7
$str
¥¥8 A
,
¥¥A B
Price
µµ 
=
µµ 
product
µµ 
.
µµ  
Price
µµ  %
,
µµ% &
Description
∂∂ 
=
∂∂ 
product
∂∂ %
.
∂∂% &
Description
∂∂& 1
,
∂∂1 2
ImageUrl
∑∑ 
=
∑∑ 
product
∑∑ "
.
∑∑" #
ImageUrl
∑∑# +
,
∑∑+ ,
StockQuantity
∏∏ 
=
∏∏ 
product
∏∏  '
.
∏∏' (
	Inventory
∏∏( 1
?
∏∏1 2
.
∏∏2 3
QuantityInStock
∏∏3 B
??
∏∏C E
$num
∏∏F G
,
∏∏G H
RestockLevel
ππ 
=
ππ 
product
ππ &
.
ππ& '
	Inventory
ππ' 0
?
ππ0 1
.
ππ1 2
ReorderLevel
ππ2 >
??
ππ? A
$num
ππB C
,
ππC D

IsLowStock
∫∫ 
=
∫∫ 
(
∫∫ 
product
∫∫ %
.
∫∫% &
	Inventory
∫∫& /
?
∫∫/ 0
.
∫∫0 1
QuantityInStock
∫∫1 @
??
∫∫A C
$num
∫∫D E
)
∫∫E F
<=
∫∫G I
(
∫∫J K
product
∫∫K R
.
∫∫R S
	Inventory
∫∫S \
?
∫∫\ ]
.
∫∫] ^
ReorderLevel
∫∫^ j
??
∫∫k m
$num
∫∫n o
)
∫∫o p
,
∫∫p q
Reviews
ªª 
=
ªª 
product
ªª !
.
ªª! "
ProductReviews
ªª" 0
.
ªª0 1
Select
ªª1 7
(
ªª7 8
r
ªª8 9
=>
ªª: <
new
ªª= @
ProductReviewDTO
ªªA Q
{
ºº 
ReviewId
ΩΩ 
=
ΩΩ 
r
ΩΩ  
.
ΩΩ  !
ReviewId
ΩΩ! )
,
ΩΩ) *
UserId
ææ 
=
ææ 
r
ææ 
.
ææ 
UserId
ææ %
,
ææ% &
Username
øø 
=
øø 
r
øø  
.
øø  !
User
øø! %
.
øø% &
Username
øø& .
,
øø. /
Rating
¿¿ 
=
¿¿ 
r
¿¿ 
.
¿¿ 
Rating
¿¿ %
,
¿¿% &
Comment
¡¡ 
=
¡¡ 
r
¡¡ 
.
¡¡  
Comment
¡¡  '
,
¡¡' (

ReviewDate
¬¬ 
=
¬¬  
r
¬¬! "
.
¬¬" #

ReviewDate
¬¬# -
}
√√ 
)
√√ 
.
√√ 
ToList
√√ 
(
√√ 
)
√√ 
}
ƒƒ 
;
ƒƒ 
return
∆∆ 
productDetailsDto
∆∆ $
;
∆∆$ %
}
«« 	
}
…… 
}   ©
xD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\ProductRepository\IProductRepository.cs
	namespace

 	
EcomLib


 
.

 

Repository

 
.

 
ProductRepository

 .
{ 
public 

	interface 
IProductRepository '
{ 
Task 
< 
IEnumerable 
< 
Product  
>  !
>! "
GetAllProductsAsync# 6
(6 7
)7 8
;8 9
Task 
< 
Product 
> 
GetProductByIdAsync )
() *
int* -
	productId. 7
)7 8
;8 9
Task 
< 
IEnumerable 
< 
Product  
>  !
>! ""
GetProductsByNameAsync# 9
(9 :
string: @
productNameA L
)L M
;M N
Task 
< 
int 
> 
AddProductAsync !
(! "
Product" )
product* 1
,1 2
	Inventory3 <
	inventory= F
)F G
;G H
Task 
UpdateProductAsync 
(  
Product  '
product( /
,/ 0
	Inventory1 :
	inventory; D
)D E
;E F
Task 
DeleteProductAsync 
(  
int  #
	productId$ -
)- .
;. /
Task 
< 
IEnumerable 
<  
ProductWithSellerDTO -
>- .
>. /*
GetAllProductsWithSellersAsync0 N
(N O
)O P
;P Q
Task &
UpdateProductQuantityAsync '
(' (
int( +
	productId, 5
,5 6
int7 :
quantity; C
)C D
;D E
Task 
< 
IEnumerable 
< 
SellerProductDTO )
>) *
>* +&
GetProductsBySellerIdAsync, F
(F G
intG J
sellerIdK S
)S T
;T U
Task 
< 
ProductDetailsDTO 
> !
GetProductDetailsFull  5
(5 6
int6 9
	productId: C
)C D
;D E
} 
} ∫
wD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\PaymentRepository\PaymentRepository.cs
	namespace		 	
EcomLib		
 
.		 

Repository		 
.		 
PaymentRepository		 .
{

 
public 

class 
PaymentRepository "
:# $
IPaymentRepository% 7
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public 
PaymentRepository  
(  !
AppDbContext! -
context. 5
)5 6
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
Payment !
>! "
AddPaymentAsync# 2
(2 3
Payment3 :
payment; B
)B C
{ 	
await 
_context 
. 
Payments #
.# $
AddAsync$ ,
(, -
payment- 4
)4 5
;5 6
await 
_context 
. 
SaveChangesAsync +
(+ ,
), -
;- .
return 
payment 
; 
} 	
public 
async 
Task $
UpdatePaymentStatusAsync 2
(2 3
int3 6
	paymentId7 @
,@ A
PaymentStatusB O
statusP V
)V W
{ 	
var 
payment 
= 
await 
_context  (
.( )
Payments) 1
.1 2
	FindAsync2 ;
(; <
	paymentId< E
)E F
;F G
if 
( 
payment 
!= 
null 
)  
{ 
payment   
.   
PaymentStatus   %
=  & '
status  ( .
;  . /
await!! 
_context!! 
.!! 
SaveChangesAsync!! /
(!!/ 0
)!!0 1
;!!1 2
}"" 
}## 	
}$$ 
}&& Ä
xD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\PaymentRepository\IPaymentRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
PaymentRepository .
{		 
public

 

	interface

 
IPaymentRepository

 '
{ 
Task 
< 
Payment 
> 
AddPaymentAsync %
(% &
Payment& -
payment. 5
)5 6
;6 7
Task $
UpdatePaymentStatusAsync %
(% &
int& )
	paymentId* 3
,3 4
PaymentStatus5 B
statusC I
)I J
;J K
} 
} ﬂ-
sD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\OrderRepository\OrderRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
OrderRepository ,
{ 
public 

class 
OrderRepository  
:! "
IOrderRepository# 3
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public 
OrderRepository 
( 
AppDbContext +
context, 3
)3 4
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
AdminOrderDTO& 3
>3 4
>4 5
GetAllOrdersAsync6 G
(G H
)H I
{ 	
return 
await 
_context !
.! "
Orders" (
. 
Include 
( 
o 
=> 
o 
.  
User  $
)$ %
. 
Select 
( 
o 
=> 
new  
AdminOrderDTO! .
{ 
OrderId 
= 
o 
.  
OrderId  '
,' (
UserName 
= 
o  
.  !
User! %
.% &
Username& .
,. /
	OrderDate 
= 
o  !
.! "
	OrderDate" +
,+ ,
TotalAmount 
=  !
o" #
.# $
TotalAmount$ /
,/ 0
OrderStatus   
=    !
o  " #
.  # $
OrderStatus  $ /
}!! 
)!! 
.!! 
ToListAsync!! 
(!! 
)!!  
;!!  !
}"" 	
public## 
async## 
Task## 
<## 
Order## 
>##  
AddOrderAsync##! .
(##. /
Order##/ 4
order##5 :
)##: ;
{$$ 	
await%% 
_context%% 
.%% 
Orders%% !
.%%! "
AddAsync%%" *
(%%* +
order%%+ 0
)%%0 1
;%%1 2
await&& 
_context&& 
.&& 
SaveChangesAsync&& +
(&&+ ,
)&&, -
;&&- .
return'' 
order'' 
;'' 
}(( 	
public** 
async** 
Task** 
<** 
Order** 
>**  
GetOrderByIdAsync**! 2
(**2 3
int**3 6
orderId**7 >
)**> ?
{++ 	
var,, 
order,, 
=,, 
await,, 
_context,, &
.,,& '
Orders,,' -
.,,- .
Include,,. 5
(,,5 6
o,,6 7
=>,,8 :
o,,; <
.,,< =

OrderItems,,= G
),,G H
.,,H I
FirstOrDefaultAsync,,I \
(,,\ ]
o,,] ^
=>,,_ a
o,,b c
.,,c d
OrderId,,d k
==,,l n
orderId,,o v
),,v w
;,,w x
if-- 
(-- 
order-- 
==-- 
null-- 
)-- 
{.. 
throw// 
new// "
OrderNotFoundException// 0
(//0 1
orderId//1 8
)//8 9
;//9 :
}00 
return11 
order11 
;11 
}22 	
public44 
async44 
Task44 "
UpdateOrderStatusAsync44 0
(440 1
int441 4
orderId445 <
,44< =
OrderStatus44> I
status44J P
)44P Q
{55 	
var66 
order66 
=66 
await66 
GetOrderByIdAsync66 /
(66/ 0
orderId660 7
)667 8
;668 9
order77 
.77 
OrderStatus77 
=77 
status77  &
;77& '
await88 
_context88 
.88 
SaveChangesAsync88 +
(88+ ,
)88, -
;88- .
}99 	
public;; 
async;; 
Task;; 
<;; 
bool;; 
>;; '
AllOrderItemsProcessedAsync;;  ;
(;;; <
int;;< ?
orderId;;@ G
);;G H
{<< 	
var== 

orderItems== 
=== 
await== "
_context==# +
.==+ ,

OrderItems==, 6
.==6 7
Where==7 <
(==< =
oi=== ?
=>==@ B
oi==C E
.==E F
OrderId==F M
====N P
orderId==Q X
)==X Y
.==Y Z
ToListAsync==Z e
(==e f
)==f g
;==g h
return>> 

orderItems>> 
.>> 
All>> !
(>>! "
oi>>" $
=>>>% '
oi>>( *
.>>* +

ItemStatus>>+ 5
==>>6 8
OrderItemStatus>>9 H
.>>H I
	Processed>>I R
)>>R S
;>>S T
}?? 	
publicAA 
asyncAA 
TaskAA 
<AA 
decimalAA !
>AA! " 
GetTotalRevenueAsyncAA# 7
(AA7 8
)AA8 9
{BB 	
varDD 
totalRevenueDD 
=DD 
awaitDD $
_contextDD% -
.DD- .
OrdersDD. 4
.EE 
SumAsyncEE 
(EE 
oEE 
=>EE 
oEE  
.EE  !
TotalAmountEE! ,
)EE, -
;EE- .
returnGG 
totalRevenueGG 
;GG  
}HH 	
}II 
}KK ÃF
wD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\OrderRepository\OrderItemRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
OrderRepository ,
{ 
public 

class 
OrderItemRepository $
:% & 
IOrderItemRepository' ;
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public 
OrderItemRepository "
(" #
AppDbContext# /
context0 7
)7 8
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
	OrderItem #
># $
AddOrderItemAsync% 6
(6 7
	OrderItem7 @
	orderItemA J
)J K
{ 	
await 
_context 
. 

OrderItems %
.% &
AddAsync& .
(. /
	orderItem/ 8
)8 9
;9 :
await 
_context 
. 
SaveChangesAsync +
(+ ,
), -
;- .
return 
	orderItem 
; 
} 	
public 
async 
Task &
UpdateOrderItemStatusAsync 4
(4 5
int5 8
orderItemId9 D
,D E
OrderItemStatusF U
statusV \
)\ ]
{ 	
var   
	orderItem   
=   
await   !
_context  " *
.  * +

OrderItems  + 5
.  5 6
	FindAsync  6 ?
(  ? @
orderItemId  @ K
)  K L
;  L M
if!! 
(!! 
	orderItem!! 
==!! 
null!! !
)!!! "
{"" 
throw## 
new## &
OrderItemNotFoundException## 4
(##4 5
orderItemId##5 @
)##@ A
;##A B
}$$ 
	orderItem&& 
.&& 

ItemStatus&&  
=&&! "
status&&# )
;&&) *
await'' 
_context'' 
.'' 
SaveChangesAsync'' +
(''+ ,
)'', -
;''- .
}(( 	
public** 
async** 
Task** 
<** 
List** 
<** 
	OrderItem** (
>**( )
>**) *'
GetOrderItemsByOrderIdAsync**+ F
(**F G
int**G J
orderId**K R
)**R S
{++ 	
return,, 
await,, 
_context,, !
.,,! "

OrderItems,," ,
.,,, -
Where,,- 2
(,,2 3
oi,,3 5
=>,,6 8
oi,,9 ;
.,,; <
OrderId,,< C
==,,D F
orderId,,G N
),,N O
.,,O P
ToListAsync,,P [
(,,[ \
),,\ ]
;,,] ^
}-- 	
public.. 
async.. 
Task.. 
<.. 
	OrderItem.. #
>..# $!
GetOrderItemByIdAsync..% :
(..: ;
int..; >
orderItemId..? J
)..J K
{// 	
return00 
await00 
_context00 !
.00! "

OrderItems00" ,
.00, -
FirstOrDefaultAsync00- @
(00@ A
oi00A C
=>00D F
oi00G I
.00I J
OrderItemId00J U
==00V X
orderItemId00Y d
)00d e
;00e f
}11 	
public22 
async22 
Task22 
<22 
IEnumerable22 %
<22% &
SellerOrderItemDTO22& 8
>228 9
>229 :(
GetOrderItemsBySellerIdAsync22; W
(22W X
int22X [
sellerId22\ d
)22d e
{33 	
return44 
await44 
_context44 !
.44! "

OrderItems44" ,
.55 
Include55 
(55 
oi55 
=>55 
oi55 !
.55! "
Product55" )
)55) *
.66 
Include66 
(66 
oi66 
=>66 
oi66 !
.66! "
Order66" '
)66' (
.77 
ThenInclude77 
(77 
o77 
=>77 !
o77" #
.77# $
User77$ (
)77( )
.88 
Where88 
(88 
oi88 
=>88 
oi88 
.88  
Product88  '
.88' (
SellerId88( 0
==881 3
sellerId884 <
)88< =
.99 
Select99 
(99 
oi99 
=>99 
new99 !
SellerOrderItemDTO99" 4
{:: 
OrderItemId;; 
=;;  !
oi;;" $
.;;$ %
OrderItemId;;% 0
,;;0 1
ProductName<< 
=<<  !
oi<<" $
.<<$ %
Product<<% ,
.<<, -
ProductName<<- 8
,<<8 9
Quantity== 
=== 
oi== !
.==! "
Quantity==" *
,==* +
	UnitPrice>> 
=>> 
oi>>  "
.>>" #
	UnitPrice>># ,
,>>, -

TotalPrice?? 
=??  
oi??! #
.??# $

TotalPrice??$ .
,??. /

ItemStatus@@ 
=@@  
oi@@! #
.@@# $

ItemStatus@@$ .
,@@. /
UserNameAA 
=AA 
oiAA !
.AA! "
OrderAA" '
.AA' (
UserAA( ,
.AA, -
UsernameAA- 5
}BB 
)BB 
.BB 
ToListAsyncBB 
(BB 
)BB  
;BB  !
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
decimalEE !
>EE! "(
GetTotalRevenueBySellerAsyncEE# ?
(EE? @
intEE@ C
sellerIdEED L
)EEL M
{FF 	
varHH  
totalRevenueBySellerHH $
=HH% &
awaitHH' ,
_contextHH- 5
.HH5 6

OrderItemsHH6 @
.II 
WhereII 
(II 
oiII 
=>II 
oiII 
.II  
SellerIdII  (
==II) +
sellerIdII, 4
)II4 5
.JJ 
SumAsyncJJ 
(JJ 
oiJJ 
=>JJ 
oiJJ  "
.JJ" #

TotalPriceJJ# -
)JJ- .
;JJ. /
returnLL  
totalRevenueBySellerLL '
;LL' (
}MM 	
publicOO 
asyncOO 
TaskOO 
<OO 
ListOO 
<OO 
OrderItemuserDTOOO /
>OO/ 0
>OO0 1&
GetOrderItemsByUserIdAsyncOO2 L
(OOL M
intOOM P
userIdOOQ W
)OOW X
{PP 	
returnQQ 
awaitQQ 
_contextQQ !
.QQ! "

OrderItemsQQ" ,
.RR 
IncludeRR 
(RR 
oiRR 
=>RR 
oiRR !
.RR! "
ProductRR" )
)RR) *
.SS 
IncludeSS 
(SS 
oiSS 
=>SS 
oiSS !
.SS! "
OrderSS" '
)SS' (
.TT 
ThenIncludeTT 
(TT 
oTT 
=>TT !
oTT" #
.TT# $
UserTT$ (
)TT( )
.UU 
WhereUU 
(UU 
oiUU 
=>UU 
oiUU 
.UU  
OrderUU  %
.UU% &
UserIdUU& ,
==UU- /
userIdUU0 6
)UU6 7
.VV 
SelectVV 
(VV 
oiVV 
=>VV 
newVV !
OrderItemuserDTOVV" 2
{WW 
OrderItemIdXX 
=XX  !
oiXX" $
.XX$ %
OrderItemIdXX% 0
,XX0 1
ProductNameYY 
=YY  !
oiYY" $
.YY$ %
ProductYY% ,
.YY, -
ProductNameYY- 8
,YY8 9
QuantityZZ 
=ZZ 
oiZZ !
.ZZ! "
QuantityZZ" *
,ZZ* +
	UnitPrice[[ 
=[[ 
oi[[  "
.[[" #
	UnitPrice[[# ,
,[[, -

TotalPrice\\ 
=\\  
oi\\! #
.\\# $

TotalPrice\\$ .
,\\. /

ItemStatus]] 
=]]  
oi]]! #
.]]# $

ItemStatus]]$ .
.]]. /
ToString]]/ 7
(]]7 8
)]]8 9
,]]9 :
UserName^^ 
=^^ 
oi^^ !
.^^! "
Order^^" '
.^^' (
User^^( ,
.^^, -
Username^^- 5
,^^5 6
ImageUrl__ 
=__ 
oi__ !
.__! "
Product__" )
.__) *
ImageUrl__* 2
}`` 
)`` 
.aa 
ToListAsyncaa 
(aa 
)aa 
;aa 
}bb 	
}ee 
}gg ø
tD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\OrderRepository\IOrderRepository.cs
	namespace		 	
EcomLib		
 
.		 

Repository		 
.		 
OrderRepository		 ,
{

 
public 

	interface 
IOrderRepository %
{ 
Task 
< 
Order 
> 
AddOrderAsync !
(! "
Order" '
order( -
)- .
;. /
Task 
< 
Order 
> 
GetOrderByIdAsync %
(% &
int& )
orderId* 1
)1 2
;2 3
Task "
UpdateOrderStatusAsync #
(# $
int$ '
orderId( /
,/ 0
OrderStatus1 <
status= C
)C D
;D E
Task 
< 
bool 
> '
AllOrderItemsProcessedAsync .
(. /
int/ 2
orderId3 :
): ;
;; <
Task 
< 
IEnumerable 
< 
AdminOrderDTO &
>& '
>' (
GetAllOrdersAsync) :
(: ;
); <
;< =
Task 
< 
decimal 
>  
GetTotalRevenueAsync *
(* +
)+ ,
;, -
} 
} Ç
xD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\OrderRepository\IOrderItemRepository.cs
	namespace		 	
EcomLib		
 
.		 

Repository		 
.		 
OrderRepository		 ,
{

 
public 

	interface  
IOrderItemRepository )
{ 
Task 
< 
	OrderItem 
> 
AddOrderItemAsync )
() *
	OrderItem* 3
	orderItem4 =
)= >
;> ?
Task &
UpdateOrderItemStatusAsync '
(' (
int( +
orderItemId, 7
,7 8
OrderItemStatus9 H
statusI O
)O P
;P Q
Task 
< 
List 
< 
	OrderItem 
> 
> '
GetOrderItemsByOrderIdAsync 9
(9 :
int: =
orderId> E
)E F
;F G
Task 
< 
IEnumerable 
< 
SellerOrderItemDTO +
>+ ,
>, -(
GetOrderItemsBySellerIdAsync. J
(J K
intK N
sellerIdO W
)W X
;X Y
Task 
< 
decimal 
> (
GetTotalRevenueBySellerAsync 2
(2 3
int3 6
sellerId7 ?
)? @
;@ A
Task 
< 
	OrderItem 
> !
GetOrderItemByIdAsync -
(- .
int. 1
orderItemId2 =
)= >
;> ?
Task 
< 
List 
< 
OrderItemuserDTO "
>" #
># $&
GetOrderItemsByUserIdAsync% ?
(? @
int@ C
userIdD J
)J K
;K L
} 
} §
sD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\LoginRepository\LoginRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
LoginRepository ,
{ 
public 

class 
LoginRepository  
:! "
ILoginRepository# 3
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
private 
readonly 
IUserRepository (
_userRepository) 8
;8 9
public 
LoginRepository 
( 
AppDbContext +
context, 3
,3 4
IUserRepository5 D
userRepositoryE S
)S T
{ 	
_context 
= 
context 
; 
_userRepository 
= 
userRepository ,
;, -
} 	
public 
async 
Task 
< 
bool 
> 
ValidateLoginAsync  2
(2 3
string3 9
usernameOrEmail: I
,I J
stringK Q
passwordR Z
)Z [
{ 	
var 
user 
= 
await 
_context %
.% &
Users& +
. 
FirstOrDefaultAsync $
($ %
u% &
=>' )
(* +
u+ ,
., -
Username- 5
==6 8
usernameOrEmail9 H
||I K
uL M
.M N
EmailN S
==T V
usernameOrEmailW f
)f g
&&h j
uk l
.l m
IsActivem u
)u v
;v w
if   
(   
user   
==   
null   
||   
!    !
BCrypt  ! '
.  ' (
Net  ( +
.  + ,
BCrypt  , 2
.  2 3
Verify  3 9
(  9 :
password  : B
,  B C
user  D H
.  H I
PasswordHash  I U
)  U V
)  V W
{!! 
if## 
(## 
user## 
!=## 
null##  
)##  !
{$$ 
await%% 
_userRepository%% )
.%%) *
LogUserAction%%* 7
(%%7 8
user&& 
.&& 
UserId&& #
,&&# $
$"'' 
{'' 
user'' 
.''  
Role''  $
.''$ %
ToString''% -
(''- .
)''. /
}''/ 0
$str''0 =
"''= >
,''> ?
$str(( 
,((  
user)) 
.)) 
UserId)) #
,))# $
$"** 
$str** >
{**> ?
user**? C
.**C D
Username**D L
}**L M
$str**M N
"**N O
)++ 
;++ 
},, 
return.. 
false.. 
;.. 
}// 
await22 
_userRepository22 !
.22! "
LogUserAction22" /
(22/ 0
user33 
.33 
UserId33 
,33 
$"44 
{44 
user44 
.44 
Role44 
.44 
ToString44 %
(44% &
)44& '
}44' (
$str44( 2
"442 3
,443 4
$str55 
,55 
user66 
.66 
UserId66 
,66 
$"77 
{77 
user77 
.77 
Role77 
.77 
ToString77 %
(77% &
)77& '
}77' (
$str77( 8
{778 9
user779 =
.77= >
Username77> F
}77F G
$str77G _
"77_ `
)88 
;88 
return:: 
true:: 
;:: 
};; 	
}<< 
}== Ì
tD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\LoginRepository\ILoginRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
LoginRepository ,
{ 
public		 

	interface		 
ILoginRepository		 %
{

 
Task 
< 
bool 
> 
ValidateLoginAsync %
(% &
string& ,
usernameOrEmail- <
,< =
string> D
passwordE M
)M N
;N O
} 
} É(
{D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\Inventoryrepository\InventoryRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
Inventoryrepository 0
{ 
public 

class 
InventoryRepository $
:% & 
IInventoryRepository' ;
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public 
InventoryRepository "
(" #
AppDbContext# /
context0 7
)7 8
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
	Inventory& /
>/ 0
>0 1"
GetAllInventoriesAsync2 H
(H I
)I J
{ 	
return 
await 
_context !
.! "
Inventories" -
.! "
Include" )
() *
i* +
=>, .
i/ 0
.0 1
Product1 8
)8 9
.! "
ToListAsync" -
(- .
). /
;/ 0
} 	
public 
async 
Task 
< 
	Inventory #
># $!
GetInventoryByIdAsync% :
(: ;
int; >
inventoryId? J
)J K
{ 	
var   
	inventory   
=   
await   !
_context  " *
.  * +
Inventories  + 6
.!!* +
Include!!+ 2
(!!2 3
i!!3 4
=>!!5 7
i!!8 9
.!!9 :
Product!!: A
)!!A B
.""* +
FirstOrDefaultAsync""+ >
(""> ?
i""? @
=>""A C
i""D E
.""E F
InventoryId""F Q
==""R T
inventoryId""U `
)""` a
;""a b
if$$ 
($$ 
	inventory$$ 
==$$ 
null$$ !
)$$! "
{%% 
throw&& 
new&& &
InventoryNotFoundException&& 4
(&&4 5
$str&&5 @
)&&@ A
;&&A B
}'' 
return)) 
	inventory)) 
;)) 
}** 	
public,, 
async,, 
Task,, 
<,, 
IEnumerable,, %
<,,% &
	Inventory,,& /
>,,/ 0
>,,0 1*
GetInventoriesByProductIdAsync,,2 P
(,,P Q
int,,Q T
	productId,,U ^
),,^ _
{-- 	
var.. 
inventories.. 
=.. 
await.. #
_context..$ ,
..., -
Inventories..- 8
.//, -
Include//- 4
(//4 5
i//5 6
=>//7 9
i//: ;
.//; <
Product//< C
)//C D
.00, -
Where00- 2
(002 3
i003 4
=>005 7
i008 9
.009 :
	ProductId00: C
==00D F
	productId00G P
)00P Q
.11, -
ToListAsync11- 8
(118 9
)119 :
;11: ;
if33 
(33 
!33 
inventories33 
.33 
Any33  
(33  !
)33! "
)33" #
{44 
throw55 
new55 &
InventoryNotFoundException55 4
(554 5
$"555 7
$str557 B
{55B C
	productId55C L
}55L M
"55M N
)55N O
;55O P
}66 
return88 
inventories88 
;88 
}99 	
public;; 
async;; 
Task;; 
<;; 
IEnumerable;; %
<;;% &
	Inventory;;& /
>;;/ 0
>;;0 1,
 GetInventoriesByProductNameAsync;;2 R
(;;R S
string;;S Y
productName;;Z e
);;e f
{<< 	
var== 
inventories== 
=== 
await== #
_context==$ ,
.==, -
Inventories==- 8
.>>, -
Include>>- 4
(>>4 5
i>>5 6
=>>>7 9
i>>: ;
.>>; <
Product>>< C
)>>C D
.??, -
Where??- 2
(??2 3
i??3 4
=>??5 7
i??8 9
.??9 :
Product??: A
.??A B
ProductName??B M
.??M N
Contains??N V
(??V W
productName??W b
)??b c
)??c d
.@@, -
ToListAsync@@- 8
(@@8 9
)@@9 :
;@@: ;
ifBB 
(BB 
!BB 
inventoriesBB 
.BB 
AnyBB  
(BB  !
)BB! "
)BB" #
{CC 
throwDD 
newDD &
InventoryNotFoundExceptionDD 4
(DD4 5
productNameDD5 @
)DD@ A
;DDA B
}EE 
returnGG 
inventoriesGG 
;GG 
}HH 	
}II 
}JJ ô

|D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\Inventoryrepository\IInventoryRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
Inventoryrepository 0
{		 
public

 

	interface

  
IInventoryRepository

 )
{ 
Task 
< 
IEnumerable 
< 
	Inventory "
>" #
># $"
GetAllInventoriesAsync% ;
(; <
)< =
;= >
Task 
< 
	Inventory 
> !
GetInventoryByIdAsync -
(- .
int. 1
inventoryId2 =
)= >
;> ?
Task 
< 
IEnumerable 
< 
	Inventory "
>" #
># $*
GetInventoriesByProductIdAsync% C
(C D
intD G
	productIdH Q
)Q R
;R S
Task 
< 
IEnumerable 
< 
	Inventory "
>" #
># $,
 GetInventoriesByProductNameAsync% E
(E F
stringF L
productNameM X
)X Y
;Y Z
} 
} æ
ÄD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\DiscountRepository\ProductDiscountRepository.cs
	namespace

 	
EcomLib


 
.

 

Repository

 
.

 
DiscountRepository

 /
{ 
public 

class %
ProductDiscountRepository *
:+ ,&
IProductDiscountRepository- G
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public %
ProductDiscountRepository (
(( )
AppDbContext) 5
context6 =
)= >
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
ProductDiscount& 5
>5 6
>6 7'
GetAllProductDiscountsAsync8 S
(S T
)T U
{ 	
return 
await 
_context !
.! "
ProductDiscounts" 2
.2 3
ToListAsync3 >
(> ?
)? @
;@ A
} 	
public 
async 
Task 
< 
ProductDiscount )
>) *'
GetProductDiscountByIdAsync+ F
(F G
intG J
productDiscountIdK \
)\ ]
{ 	
return 
await 
_context !
.! "
ProductDiscounts" 2
. 
FirstOrDefaultAsync $
($ %
pd% '
=>( *
pd+ -
.- .
ProductDiscountId. ?
==@ B
productDiscountIdC T
)T U
;U V
} 	
public   
async   
Task   &
CreateProductDiscountAsync   4
(  4 5
ProductDiscount  5 D
productDiscount  E T
)  T U
{!! 	
await"" 
_context"" 
."" 
ProductDiscounts"" +
.""+ ,
AddAsync"", 4
(""4 5
productDiscount""5 D
)""D E
;""E F
await## 
_context## 
.## 
SaveChangesAsync## +
(##+ ,
)##, -
;##- .
}$$ 	
public&& 
async&& 
Task&& &
UpdateProductDiscountAsync&& 4
(&&4 5
ProductDiscount&&5 D
productDiscount&&E T
)&&T U
{'' 	
_context(( 
.(( 
ProductDiscounts(( %
.((% &
Update((& ,
(((, -
productDiscount((- <
)((< =
;((= >
await)) 
_context)) 
.)) 
SaveChangesAsync)) +
())+ ,
))), -
;))- .
}** 	
public,, 
async,, 
Task,, &
DeleteProductDiscountAsync,, 4
(,,4 5
int,,5 8
productDiscountId,,9 J
),,J K
{-- 	
var.. 
productDiscount.. 
=..  !
await.." ''
GetProductDiscountByIdAsync..( C
(..C D
productDiscountId..D U
)..U V
;..V W
if// 
(// 
productDiscount// 
!=//  "
null//# '
)//' (
{00 
_context11 
.11 
ProductDiscounts11 )
.11) *
Remove11* 0
(110 1
productDiscount111 @
)11@ A
;11A B
await22 
_context22 
.22 
SaveChangesAsync22 /
(22/ 0
)220 1
;221 2
}33 
}44 	
}55 
}77 ¿
zD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\DiscountRepository\IDiscountRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
DiscountRepository /
{		 
public

 

	interface

 
IDiscountRepository

 (
{ 
Task 
< 
IEnumerable 
< 
Discount !
>! "
>" # 
GetAllDiscountsAsync$ 8
(8 9
)9 :
;: ;
Task 
< 
Discount 
>  
GetDiscountByIdAsync +
(+ ,
int, /

discountId0 :
): ;
;; <
Task 
< 
Discount 
> "
GetDiscountByCodeAsync -
(- .
string. 4
discountCode5 A
)A B
;B C
Task 
< 
Discount 
> 
CreateDiscountAsync *
(* +
Discount+ 3
discount4 <
)< =
;= >
Task 
< 
Discount 
> 
UpdateDiscountAsync *
(* +
int+ .

discountId/ 9
,9 :
Discount; C
discountD L
)L M
;M N
Task 
< 
bool 
> 
DeleteDiscountAsync &
(& '
int' *

discountId+ 5
)5 6
;6 7
} 
} ï

ÅD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\DiscountRepository\IProductDiscountRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
DiscountRepository /
{		 
public

 

	interface

 &
IProductDiscountRepository

 /
{ 
Task 
< 
IEnumerable 
< 
ProductDiscount (
>( )
>) *'
GetAllProductDiscountsAsync+ F
(F G
)G H
;H I
Task 
< 
ProductDiscount 
> '
GetProductDiscountByIdAsync 9
(9 :
int: =
productDiscountId> O
)O P
;P Q
Task &
CreateProductDiscountAsync '
(' (
ProductDiscount( 7
productDiscount8 G
)G H
;H I
Task &
UpdateProductDiscountAsync '
(' (
ProductDiscount( 7
productDiscount8 G
)G H
;H I
Task &
DeleteProductDiscountAsync '
(' (
int( +
productDiscountId, =
)= >
;> ?
} 
} À-
yD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\DiscountRepository\DiscountRepository.cs
	namespace

 	
EcomLib


 
.

 

Repository

 
.

 
DiscountRepository

 /
{ 
public 

class 
DiscountRepository #
:$ %
IDiscountRepository& 9
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public 
DiscountRepository !
(! "
AppDbContext" .
context/ 6
)6 7
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Discount& .
>. /
>/ 0 
GetAllDiscountsAsync1 E
(E F
)F G
{ 	
return 
await 
_context !
.! "
	Discounts" +
.+ ,
ToListAsync, 7
(7 8
)8 9
;9 :
} 	
public 
async 
Task 
< 
Discount "
>" # 
GetDiscountByIdAsync$ 8
(8 9
int9 <

discountId= G
)G H
{ 	
return 
await 
_context !
.! "
	Discounts" +
.+ ,
	FindAsync, 5
(5 6

discountId6 @
)@ A
;A B
} 	
public 
async 
Task 
< 
Discount "
>" #"
GetDiscountByCodeAsync$ :
(: ;
string; A
discountCodeB N
)N O
{   	
return!! 
await!! 
_context!! !
.!!! "
	Discounts!!" +
."" 
FirstOrDefaultAsync"" $
(""$ %
d""% &
=>""' )
d""* +
.""+ ,
DiscountCode"", 8
==""9 ;
discountCode""< H
)""H I
;""I J
}## 	
public$$ 
async$$ 
Task$$ 
<$$ 
Discount$$ "
>$$" #
CreateDiscountAsync$$$ 7
($$7 8
Discount$$8 @
discount$$A I
)$$I J
{%% 	
_context&& 
.&& 
	Discounts&& 
.&& 
Add&& "
(&&" #
discount&&# +
)&&+ ,
;&&, -
await'' 
_context'' 
.'' 
SaveChangesAsync'' +
(''+ ,
)'', -
;''- .
return(( 
discount(( 
;(( 
})) 	
public++ 
async++ 
Task++ 
<++ 
Discount++ "
>++" #
UpdateDiscountAsync++$ 7
(++7 8
int++8 ;

discountId++< F
,++F G
Discount++H P
discount++Q Y
)++Y Z
{,, 	
var-- 
existingDiscount--  
=--! "
await--# (
_context--) 1
.--1 2
	Discounts--2 ;
.--; <
	FindAsync--< E
(--E F

discountId--F P
)--P Q
;--Q R
if.. 
(.. 
existingDiscount..  
==..! #
null..$ (
)..( )
return..* 0
null..1 5
;..5 6
existingDiscount00 
.00 
DiscountCode00 )
=00* +
discount00, 4
.004 5
DiscountCode005 A
;00A B
existingDiscount11 
.11 
Description11 (
=11) *
discount11+ 3
.113 4
Description114 ?
;11? @
existingDiscount22 
.22 
DiscountType22 )
=22* +
discount22, 4
.224 5
DiscountType225 A
;22A B
existingDiscount33 
.33 
DiscountValue33 *
=33+ ,
discount33- 5
.335 6
DiscountValue336 C
;33C D
existingDiscount44 
.44 
	StartDate44 &
=44' (
discount44) 1
.441 2
	StartDate442 ;
;44; <
existingDiscount55 
.55 
EndDate55 $
=55% &
discount55' /
.55/ 0
EndDate550 7
;557 8
existingDiscount66 
.66 
IsActive66 %
=66& '
discount66( 0
.660 1
IsActive661 9
;669 :
await88 
_context88 
.88 
SaveChangesAsync88 +
(88+ ,
)88, -
;88- .
return99 
existingDiscount99 #
;99# $
}:: 	
public<< 
async<< 
Task<< 
<<< 
bool<< 
><< 
DeleteDiscountAsync<<  3
(<<3 4
int<<4 7

discountId<<8 B
)<<B C
{== 	
var>> 
discount>> 
=>> 
await>>  
_context>>! )
.>>) *
	Discounts>>* 3
.>>3 4
	FindAsync>>4 =
(>>= >

discountId>>> H
)>>H I
;>>I J
if?? 
(?? 
discount?? 
==?? 
null??  
)??  !
return??" (
false??) .
;??. /
_contextAA 
.AA 
	DiscountsAA 
.AA 
RemoveAA %
(AA% &
discountAA& .
)AA. /
;AA/ 0
awaitBB 
_contextBB 
.BB 
SaveChangesAsyncBB +
(BB+ ,
)BB, -
;BB- .
returnCC 
trueCC 
;CC 
}DD 	
}EE 
}FF ë
zD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\CategoryRepository\ICategoryRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
CategoryRepository /
{		 
public

 

	interface

 
ICategoryRepository

 (
{ 
Task 
< 
int 
> "
AddParentCategoryAsync (
(( )
ParentCategoryDTO) :
parentCategoryDTO; L
)L M
;M N
Task 
< 
ParentCategoryDTO 
> &
GetParentCategoryByIdAsync  :
(: ;
int; >
parentCategoryId? O
)O P
;P Q
Task 
< 
IEnumerable 
< 
ParentCategoryDTO *
>* +
>+ ,'
GetAllParentCategoriesAsync- H
(H I
)I J
;J K
Task 
< 
ParentCategoryDTO 
> %
UpdateParentCategoryAsync  9
(9 :
ParentCategoryDTO: K
parentCategoryDTOL ]
)] ^
;^ _
Task 
< 
bool 
> %
DeleteParentCategoryAsync ,
(, -
int- 0
parentCategoryId1 A
)A B
;B C
Task 
< 
int 
> 
AddSubCategoryAsync %
(% &
SubCategoryDTO& 4
subCategoryDTO5 C
)C D
;D E
Task 
< 
SubCategoryDTO 
> #
GetSubCategoryByIdAsync 4
(4 5
int5 8
subCategoryId9 F
)F G
;G H
Task 
< 
IEnumerable 
< 
SubCategoryDTO '
>' (
>( )$
GetAllSubCategoriesAsync* B
(B C
)C D
;D E
Task 
< 
IEnumerable 
< 
SubCategoryDTO '
>' (
>( )+
GetSubCategoriesByParentIdAsync* I
(I J
intJ M
parentCategoryIdN ^
)^ _
;_ `
Task 
< 
SubCategoryDTO 
> "
UpdateSubCategoryAsync 3
(3 4
SubCategoryDTO4 B
subCategoryDTOC Q
)Q R
;R S
Task 
< 
bool 
> "
DeleteSubCategoryAsync )
() *
int* -
subCategoryId. ;
); <
;< =
Task 
< 
int 
> 
AddBrandAsync 
(  
BrandDTO  (
brandDTO) 1
)1 2
;2 3
Task 
< 
BrandDTO 
> 
GetBrandByIdAsync (
(( )
int) ,
brandId- 4
)4 5
;5 6
Task 
< 
IEnumerable 
< 
BrandDTO !
>! "
>" #
GetAllBrandsAsync$ 5
(5 6
)6 7
;7 8
Task 
< 
BrandDTO 
> 
GetBrandByNameAsync *
(* +
string+ 1
	brandName2 ;
); <
;< =
Task   
<   
BrandDTO   
>   
UpdateBrandAsync   '
(  ' (
BrandDTO  ( 0
brandDTO  1 9
)  9 :
;  : ;
Task!! 
<!! 
bool!! 
>!! 
DeleteBrandAsync!! #
(!!# $
int!!$ '
brandId!!( /
)!!/ 0
;!!0 1
}"" 
}$$ ÷ 
yD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\CategoryRepository\CategoryRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
CategoryRepository /
{ 
public 

class 
CategoryRepository #
:$ %
ICategoryRepository& 9
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public 
CategoryRepository !
(! "
AppDbContext" .
context/ 6
)6 7
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
int 
> "
AddParentCategoryAsync 5
(5 6
ParentCategoryDTO6 G
parentCategoryDTOH Y
)Y Z
{ 	
var 
existingCategory  
=! "
await# (
_context) 1
.1 2
ParentCategories2 B
. 
FirstOrDefaultAsync $
($ %
c% &
=>' )
c* +
.+ ,
CategoryName, 8
==9 ;
parentCategoryDTO< M
.M N
CategoryNameN Z
)Z [
;[ \
if 
( 
existingCategory  
!=! #
null$ (
)( )
{ 
throw 
new &
ItemAlreadyExistsException 4
(4 5
$str5 U
)U V
;V W
}   
var"" 
parentCategory"" 
=""  
new""! $
ParentCategory""% 3
{## 
CategoryName$$ 
=$$ 
parentCategoryDTO$$ 0
.$$0 1
CategoryName$$1 =
,$$= >
Description%% 
=%% 
parentCategoryDTO%% /
.%%/ 0
Description%%0 ;
}&& 
;&& 
_context(( 
.(( 
ParentCategories(( %
.((% &
Add((& )
((() *
parentCategory((* 8
)((8 9
;((9 :
await)) 
_context)) 
.)) 
SaveChangesAsync)) +
())+ ,
))), -
;))- .
return** 
parentCategory** !
.**! "
ParentCategoryId**" 2
;**2 3
}++ 	
public.. 
async.. 
Task.. 
<.. 
ParentCategoryDTO.. +
>..+ ,&
GetParentCategoryByIdAsync..- G
(..G H
int..H K
parentCategoryId..L \
)..\ ]
{// 	
var00 
parentCategory00 
=00  
await00! &
_context00' /
.00/ 0
ParentCategories000 @
.11 
FirstOrDefaultAsync11 $
(11$ %
pc11% '
=>11( *
pc11+ -
.11- .
ParentCategoryId11. >
==11? A
parentCategoryId11B R
)11R S
;11S T
if33 
(33 
parentCategory33 
==33 !
null33" &
)33& '
{44 
throw55 
new55 %
CategoryNotFoundException55 3
(553 4
$str554 \
)55\ ]
;55] ^
}66 
return88 
new88 
ParentCategoryDTO88 (
{99 
ParentCategoryId::  
=::! "
parentCategory::# 1
.::1 2
ParentCategoryId::2 B
,::B C
CategoryName;; 
=;; 
parentCategory;; -
.;;- .
CategoryName;;. :
,;;: ;
Description<< 
=<< 
parentCategory<< ,
.<<, -
Description<<- 8
}== 
;== 
}>> 	
public@@ 
async@@ 
Task@@ 
<@@ 
IEnumerable@@ %
<@@% &
ParentCategoryDTO@@& 7
>@@7 8
>@@8 9'
GetAllParentCategoriesAsync@@: U
(@@U V
)@@V W
{AA 	
returnBB 
awaitBB 
_contextBB !
.BB! "
ParentCategoriesBB" 2
.CC 
SelectCC 
(CC 
pcCC 
=>CC 
newCC !
ParentCategoryDTOCC" 3
{DD 
ParentCategoryIdEE $
=EE% &
pcEE' )
.EE) *
ParentCategoryIdEE* :
,EE: ;
CategoryNameFF  
=FF! "
pcFF# %
.FF% &
CategoryNameFF& 2
,FF2 3
DescriptionGG 
=GG  !
pcGG" $
.GG$ %
DescriptionGG% 0
}HH 
)HH 
.II 
ToListAsyncII 
(II 
)II 
;II 
}JJ 	
publicLL 
asyncLL 
TaskLL 
<LL 
ParentCategoryDTOLL +
>LL+ ,%
UpdateParentCategoryAsyncLL- F
(LLF G
ParentCategoryDTOLLG X
parentCategoryDTOLLY j
)LLj k
{MM 	
varNN 
parentCategoryNN 
=NN  
awaitNN! &
_contextNN' /
.NN/ 0
ParentCategoriesNN0 @
.OO 
	FindAsyncOO 
(OO 
parentCategoryDTOOO ,
.OO, -
ParentCategoryIdOO- =
)OO= >
;OO> ?
ifQQ 
(QQ 
parentCategoryQQ 
==QQ !
nullQQ" &
)QQ& '
{RR 
throwSS 
newSS %
CategoryNotFoundExceptionSS 3
(SS3 4
$strSS4 \
)SS\ ]
;SS] ^
}TT 
parentCategoryVV 
.VV 
CategoryNameVV '
=VV( )
parentCategoryDTOVV* ;
.VV; <
CategoryNameVV< H
;VVH I
parentCategoryWW 
.WW 
DescriptionWW &
=WW' (
parentCategoryDTOWW) :
.WW: ;
DescriptionWW; F
;WWF G
awaitYY 
_contextYY 
.YY 
SaveChangesAsyncYY +
(YY+ ,
)YY, -
;YY- .
returnZZ 
parentCategoryDTOZZ $
;ZZ$ %
}[[ 	
public]] 
async]] 
Task]] 
<]] 
bool]] 
>]] %
DeleteParentCategoryAsync]]  9
(]]9 :
int]]: =
parentCategoryId]]> N
)]]N O
{^^ 	
var__ 
parentCategory__ 
=__  
await__! &
_context__' /
.__/ 0
ParentCategories__0 @
.`` 
	FindAsync`` 
(`` 
parentCategoryId`` +
)``+ ,
;``, -
ifbb 
(bb 
parentCategorybb 
==bb !
nullbb" &
)bb& '
{cc 
throwdd 
newdd %
CategoryNotFoundExceptiondd 3
(dd3 4
$strdd4 \
)dd\ ]
;dd] ^
}ee 
_contextgg 
.gg 
ParentCategoriesgg %
.gg% &
Removegg& ,
(gg, -
parentCategorygg- ;
)gg; <
;gg< =
awaithh 
_contexthh 
.hh 
SaveChangesAsynchh +
(hh+ ,
)hh, -
;hh- .
returnii 
trueii 
;ii 
}jj 	
publicmm 
asyncmm 
Taskmm 
<mm 
intmm 
>mm 
AddSubCategoryAsyncmm 2
(mm2 3
SubCategoryDTOmm3 A
subCategoryDTOmmB P
)mmP Q
{nn 	
varoo 
existingSubCategoryoo #
=oo$ %
awaitoo& +
_contextoo, 4
.oo4 5
SubCategoriesoo5 B
.pp 
FirstOrDefaultAsyncpp $
(pp$ %
scpp% '
=>pp( *
scpp+ -
.pp- .
SubCategoryNamepp. =
==pp> @
subCategoryDTOppA O
.ppO P
SubCategoryNameppP _
&&pp` b
scqq+ -
.qq- .
ParentCategoryIdqq. >
==qq? A
subCategoryDTOqqB P
.qqP Q
ParentCategoryIdqqQ a
)qqa b
;qqb c
ifss 
(ss 
existingSubCategoryss #
!=ss$ &
nullss' +
)ss+ ,
{tt 
throwuu 
newuu &
ItemAlreadyExistsExceptionuu 4
(uu4 5
$struu5 R
)uuR S
;uuS T
}vv 
varxx 
subCategoryxx 
=xx 
newxx !
SubCategoryxx" -
{yy 
SubCategoryNamezz 
=zz  !
subCategoryDTOzz" 0
.zz0 1
SubCategoryNamezz1 @
,zz@ A
Description{{ 
={{ 
subCategoryDTO{{ ,
.{{, -
Description{{- 8
,{{8 9
ParentCategoryId||  
=||! "
subCategoryDTO||# 1
.||1 2
ParentCategoryId||2 B
}}} 
;}} 
_context 
. 
SubCategories "
." #
Add# &
(& '
subCategory' 2
)2 3
;3 4
await
ÄÄ 
_context
ÄÄ 
.
ÄÄ 
SaveChangesAsync
ÄÄ +
(
ÄÄ+ ,
)
ÄÄ, -
;
ÄÄ- .
return
ÅÅ 
subCategory
ÅÅ 
.
ÅÅ 
SubCategoryId
ÅÅ ,
;
ÅÅ, -
}
ÇÇ 	
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
SubCategoryDTO
ÖÖ (
>
ÖÖ( )%
GetSubCategoryByIdAsync
ÖÖ* A
(
ÖÖA B
int
ÖÖB E
subCategoryId
ÖÖF S
)
ÖÖS T
{
ÜÜ 	
var
áá 
subCategory
áá 
=
áá 
await
áá #
_context
áá$ ,
.
áá, -
SubCategories
áá- :
.
àà !
FirstOrDefaultAsync
àà $
(
àà$ %
sc
àà% '
=>
àà( *
sc
àà+ -
.
àà- .
SubCategoryId
àà. ;
==
àà< >
subCategoryId
àà? L
)
ààL M
;
ààM N
if
ää 
(
ää 
subCategory
ää 
==
ää 
null
ää #
)
ää# $
{
ãã 
throw
åå 
new
åå '
CategoryNotFoundException
åå 3
(
åå3 4
$str
åå4 Y
)
ååY Z
;
ååZ [
}
çç 
return
èè 
new
èè 
SubCategoryDTO
èè %
{
êê 
SubCategoryId
ëë 
=
ëë 
subCategory
ëë  +
.
ëë+ ,
SubCategoryId
ëë, 9
,
ëë9 :
ParentCategoryId
íí  
=
íí! "
subCategory
íí# .
.
íí. /
ParentCategoryId
íí/ ?
,
íí? @
SubCategoryName
ìì 
=
ìì  !
subCategory
ìì" -
.
ìì- .
SubCategoryName
ìì. =
,
ìì= >
Description
îî 
=
îî 
subCategory
îî )
.
îî) *
Description
îî* 5
}
ïï 
;
ïï 
}
ññ 	
public
òò 
async
òò 
Task
òò 
<
òò 
IEnumerable
òò %
<
òò% &
SubCategoryDTO
òò& 4
>
òò4 5
>
òò5 6&
GetAllSubCategoriesAsync
òò7 O
(
òòO P
)
òòP Q
{
ôô 	
return
öö 
await
öö 
_context
öö !
.
öö! "
SubCategories
öö" /
.
öö/ 0
Include
öö0 7
(
öö7 8
sc
öö8 :
=>
öö; =
sc
öö> @
.
öö@ A
ParentCategory
ööA O
)
ööO P
.
õõ 
Select
õõ 
(
õõ 
sc
õõ 
=>
õõ 
new
õõ !
SubCategoryDTO
õõ" 0
{
úú 
SubCategoryId
ùù !
=
ùù" #
sc
ùù$ &
.
ùù& '
SubCategoryId
ùù' 4
,
ùù4 5
ParentCategoryId
ûû $
=
ûû% &
sc
ûû' )
.
ûû) *
ParentCategoryId
ûû* :
,
ûû: ; 
ParentcategoryName
üü &
=
üü' (
sc
üü) +
.
üü+ ,
ParentCategory
üü, :
.
üü: ;
CategoryName
üü; G
,
üüG H
SubCategoryName
†† #
=
††$ %
sc
††& (
.
††( )
SubCategoryName
††) 8
,
††8 9
Description
°° 
=
°°  !
sc
°°" $
.
°°$ %
Description
°°% 0
}
¢¢ 
)
¢¢ 
.
££ 
ToListAsync
££ 
(
££ 
)
££ 
;
££ 
}
§§ 	
public
¶¶ 
async
¶¶ 
Task
¶¶ 
<
¶¶ 
IEnumerable
¶¶ %
<
¶¶% &
SubCategoryDTO
¶¶& 4
>
¶¶4 5
>
¶¶5 6-
GetSubCategoriesByParentIdAsync
¶¶7 V
(
¶¶V W
int
¶¶W Z
parentCategoryId
¶¶[ k
)
¶¶k l
{
ßß 	
return
®® 
await
®® 
_context
®® !
.
®®! "
SubCategories
®®" /
.
©© 
Where
©© 
(
©© 
sc
©© 
=>
©© 
sc
©© 
.
©©  
ParentCategoryId
©©  0
==
©©1 3
parentCategoryId
©©4 D
)
©©D E
.
™™ 
Select
™™ 
(
™™ 
sc
™™ 
=>
™™ 
new
™™ !
SubCategoryDTO
™™" 0
{
´´ 
SubCategoryId
¨¨ !
=
¨¨" #
sc
¨¨$ &
.
¨¨& '
SubCategoryId
¨¨' 4
,
¨¨4 5
ParentCategoryId
≠≠ $
=
≠≠% &
sc
≠≠' )
.
≠≠) *
ParentCategoryId
≠≠* :
,
≠≠: ;
SubCategoryName
ÆÆ #
=
ÆÆ$ %
sc
ÆÆ& (
.
ÆÆ( )
SubCategoryName
ÆÆ) 8
,
ÆÆ8 9
Description
ØØ 
=
ØØ  !
sc
ØØ" $
.
ØØ$ %
Description
ØØ% 0
}
∞∞ 
)
∞∞ 
.
±± 
ToListAsync
±± 
(
±± 
)
±± 
;
±± 
}
≤≤ 	
public
¥¥ 
async
¥¥ 
Task
¥¥ 
<
¥¥ 
SubCategoryDTO
¥¥ (
>
¥¥( )$
UpdateSubCategoryAsync
¥¥* @
(
¥¥@ A
SubCategoryDTO
¥¥A O
subCategoryDTO
¥¥P ^
)
¥¥^ _
{
µµ 	
var
∂∂ 
subCategory
∂∂ 
=
∂∂ 
await
∂∂ #
_context
∂∂$ ,
.
∂∂, -
SubCategories
∂∂- :
.
∑∑ 
	FindAsync
∑∑ 
(
∑∑ 
subCategoryDTO
∑∑ )
.
∑∑) *
SubCategoryId
∑∑* 7
)
∑∑7 8
;
∑∑8 9
if
ππ 
(
ππ 
subCategory
ππ 
==
ππ 
null
ππ #
)
ππ# $
{
∫∫ 
throw
ªª 
new
ªª '
CategoryNotFoundException
ªª 3
(
ªª3 4
$str
ªª4 Y
)
ªªY Z
;
ªªZ [
}
ºº 
subCategory
ææ 
.
ææ 
ParentCategoryId
ææ (
=
ææ) *
subCategoryDTO
ææ+ 9
.
ææ9 :
ParentCategoryId
ææ: J
;
ææJ K
subCategory
øø 
.
øø 
SubCategoryName
øø '
=
øø( )
subCategoryDTO
øø* 8
.
øø8 9
SubCategoryName
øø9 H
;
øøH I
subCategory
¿¿ 
.
¿¿ 
Description
¿¿ #
=
¿¿$ %
subCategoryDTO
¿¿& 4
.
¿¿4 5
Description
¿¿5 @
;
¿¿@ A
await
¬¬ 
_context
¬¬ 
.
¬¬ 
SaveChangesAsync
¬¬ +
(
¬¬+ ,
)
¬¬, -
;
¬¬- .
return
√√ 
subCategoryDTO
√√ !
;
√√! "
}
ƒƒ 	
public
∆∆ 
async
∆∆ 
Task
∆∆ 
<
∆∆ 
bool
∆∆ 
>
∆∆ $
DeleteSubCategoryAsync
∆∆  6
(
∆∆6 7
int
∆∆7 :
subCategoryId
∆∆; H
)
∆∆H I
{
«« 	
var
»» 
subCategory
»» 
=
»» 
await
»» #
_context
»»$ ,
.
»», -
SubCategories
»»- :
.
…… 
	FindAsync
…… 
(
…… 
subCategoryId
…… (
)
……( )
;
……) *
if
ÀÀ 
(
ÀÀ 
subCategory
ÀÀ 
==
ÀÀ 
null
ÀÀ #
)
ÀÀ# $
{
ÃÃ 
throw
ÕÕ 
new
ÕÕ '
CategoryNotFoundException
ÕÕ 3
(
ÕÕ3 4
$str
ÕÕ4 Y
)
ÕÕY Z
;
ÕÕZ [
}
ŒŒ 
_context
–– 
.
–– 
SubCategories
–– "
.
––" #
Remove
––# )
(
––) *
subCategory
––* 5
)
––5 6
;
––6 7
await
—— 
_context
—— 
.
—— 
SaveChangesAsync
—— +
(
——+ ,
)
——, -
;
——- .
return
““ 
true
““ 
;
““ 
}
”” 	
public
÷÷ 
async
÷÷ 
Task
÷÷ 
<
÷÷ 
int
÷÷ 
>
÷÷ 
AddBrandAsync
÷÷ ,
(
÷÷, -
BrandDTO
÷÷- 5
brandDTO
÷÷6 >
)
÷÷> ?
{
◊◊ 	
var
ÿÿ 
existingBrand
ÿÿ 
=
ÿÿ 
await
ÿÿ  %
_context
ÿÿ& .
.
ÿÿ. /
Brands
ÿÿ/ 5
.
ŸŸ !
FirstOrDefaultAsync
ŸŸ $
(
ŸŸ$ %
b
ŸŸ% &
=>
ŸŸ' )
b
ŸŸ* +
.
ŸŸ+ ,
	BrandName
ŸŸ, 5
==
ŸŸ6 8
brandDTO
ŸŸ9 A
.
ŸŸA B
	BrandName
ŸŸB K
)
ŸŸK L
;
ŸŸL M
if
€€ 
(
€€ 
existingBrand
€€ 
!=
€€  
null
€€! %
)
€€% &
{
‹‹ 
throw
›› 
new
›› (
ItemAlreadyExistsException
›› 4
(
››4 5
$str
››5 K
)
››K L
;
››L M
}
ﬁﬁ 
var
‡‡ 
brand
‡‡ 
=
‡‡ 
new
‡‡ 
Brand
‡‡ !
{
·· 
	BrandName
‚‚ 
=
‚‚ 
brandDTO
‚‚ $
.
‚‚$ %
	BrandName
‚‚% .
,
‚‚. /
Description
„„ 
=
„„ 
brandDTO
„„ &
.
„„& '
Description
„„' 2
,
„„2 3
LogoUrl
‰‰ 
=
‰‰ 
brandDTO
‰‰ "
.
‰‰" #
LogoUrl
‰‰# *
,
‰‰* +
}
ÂÂ 
;
ÂÂ 
_context
ÁÁ 
.
ÁÁ 
Brands
ÁÁ 
.
ÁÁ 
Add
ÁÁ 
(
ÁÁ  
brand
ÁÁ  %
)
ÁÁ% &
;
ÁÁ& '
await
ËË 
_context
ËË 
.
ËË 
SaveChangesAsync
ËË +
(
ËË+ ,
)
ËË, -
;
ËË- .
return
ÈÈ 
brand
ÈÈ 
.
ÈÈ 
BrandId
ÈÈ  
;
ÈÈ  !
}
ÍÍ 	
public
ÏÏ 

async
ÏÏ 
Task
ÏÏ 
<
ÏÏ 
BrandDTO
ÏÏ 
>
ÏÏ 
GetBrandByIdAsync
ÏÏ  1
(
ÏÏ1 2
int
ÏÏ2 5
brandId
ÏÏ6 =
)
ÏÏ= >
{
ÌÌ 	
var
ÓÓ 
brand
ÓÓ 
=
ÓÓ 
await
ÓÓ 
_context
ÓÓ &
.
ÓÓ& '
Brands
ÓÓ' -
.
ÔÔ !
FirstOrDefaultAsync
ÔÔ $
(
ÔÔ$ %
b
ÔÔ% &
=>
ÔÔ' )
b
ÔÔ* +
.
ÔÔ+ ,
BrandId
ÔÔ, 3
==
ÔÔ4 6
brandId
ÔÔ7 >
)
ÔÔ> ?
;
ÔÔ? @
if
ÒÒ 
(
ÒÒ 
brand
ÒÒ 
==
ÒÒ 
null
ÒÒ 
)
ÒÒ 
{
ÚÚ 
throw
ÛÛ 
new
ÛÛ $
BrandNotFoundException
ÛÛ 0
(
ÛÛ0 1
$str
ÛÛ1 O
)
ÛÛO P
;
ÛÛP Q
}
ÙÙ 
return
ˆˆ 
new
ˆˆ 
BrandDTO
ˆˆ 
{
˜˜ 
BrandId
¯¯ 
=
¯¯ 
brand
¯¯ 
.
¯¯  
BrandId
¯¯  '
,
¯¯' (
	BrandName
˘˘ 
=
˘˘ 
brand
˘˘ !
.
˘˘! "
	BrandName
˘˘" +
,
˘˘+ ,
Description
˙˙ 
=
˙˙ 
brand
˙˙ #
.
˙˙# $
Description
˙˙$ /
,
˙˙/ 0
LogoUrl
˚˚ 
=
˚˚ 
brand
˚˚ 
.
˚˚  
LogoUrl
˚˚  '
}
¸¸ 
;
¸¸ 
}
˝˝ 	
public
ˇˇ 
async
ˇˇ 
Task
ˇˇ 
<
ˇˇ 
IEnumerable
ˇˇ %
<
ˇˇ% &
BrandDTO
ˇˇ& .
>
ˇˇ. /
>
ˇˇ/ 0
GetAllBrandsAsync
ˇˇ1 B
(
ˇˇB C
)
ˇˇC D
{
ÄÄ 	
return
ÅÅ 
await
ÅÅ 
_context
ÅÅ !
.
ÅÅ! "
Brands
ÅÅ" (
.
ÇÇ 
Select
ÇÇ 
(
ÇÇ 
b
ÇÇ 
=>
ÇÇ 
new
ÇÇ  
BrandDTO
ÇÇ! )
{
ÉÉ 
BrandId
ÑÑ 
=
ÑÑ 
b
ÑÑ 
.
ÑÑ  
BrandId
ÑÑ  '
,
ÑÑ' (
	BrandName
ÖÖ 
=
ÖÖ 
b
ÖÖ  !
.
ÖÖ! "
	BrandName
ÖÖ" +
,
ÖÖ+ ,
Description
ÜÜ 
=
ÜÜ  !
b
ÜÜ" #
.
ÜÜ# $
Description
ÜÜ$ /
,
ÜÜ/ 0
LogoUrl
áá 
=
áá 
b
áá 
.
áá  
LogoUrl
áá  '
}
àà 
)
àà 
.
ââ 
ToListAsync
ââ 
(
ââ 
)
ââ 
;
ââ 
}
ää 	
public
åå 
async
åå 
Task
åå 
<
åå 
BrandDTO
åå "
>
åå" #!
GetBrandByNameAsync
åå$ 7
(
åå7 8
string
åå8 >
	brandName
åå? H
)
ååH I
{
çç 	
var
éé 
brand
éé 
=
éé 
await
éé 
_context
éé &
.
éé& '
Brands
éé' -
.
èè !
FirstOrDefaultAsync
èè $
(
èè$ %
b
èè% &
=>
èè' )
b
èè* +
.
èè+ ,
	BrandName
èè, 5
==
èè6 8
	brandName
èè9 B
)
èèB C
;
èèC D
if
ëë 
(
ëë 
brand
ëë 
==
ëë 
null
ëë 
)
ëë 
{
íí 
throw
ìì 
new
ìì $
BrandNotFoundException
ìì 0
(
ìì0 1
$str
ìì1 O
)
ììO P
;
ììP Q
}
îî 
return
ññ 
new
ññ 
BrandDTO
ññ 
{
óó 
BrandId
òò 
=
òò 
brand
òò 
.
òò  
BrandId
òò  '
,
òò' (
	BrandName
ôô 
=
ôô 
brand
ôô !
.
ôô! "
	BrandName
ôô" +
,
ôô+ ,
Description
öö 
=
öö 
brand
öö #
.
öö# $
Description
öö$ /
,
öö/ 0
LogoUrl
õõ 
=
õõ 
brand
õõ 
.
õõ  
LogoUrl
õõ  '
}
úú 
;
úú 
}
ùù 	
public
üü 
async
üü 
Task
üü 
<
üü 
BrandDTO
üü "
>
üü" #
UpdateBrandAsync
üü$ 4
(
üü4 5
BrandDTO
üü5 =
brandDTO
üü> F
)
üüF G
{
†† 	
var
°° 
brand
°° 
=
°° 
await
°° 
_context
°° &
.
°°& '
Brands
°°' -
.
¢¢ 
	FindAsync
¢¢ 
(
¢¢ 
brandDTO
¢¢ #
.
¢¢# $
BrandId
¢¢$ +
)
¢¢+ ,
;
¢¢, -
if
§§ 
(
§§ 
brand
§§ 
==
§§ 
null
§§ 
)
§§ 
{
•• 
throw
¶¶ 
new
¶¶ $
BrandNotFoundException
¶¶ 0
(
¶¶0 1
$str
¶¶1 O
)
¶¶O P
;
¶¶P Q
}
ßß 
brand
©© 
.
©© 
	BrandName
©© 
=
©© 
brandDTO
©© &
.
©©& '
	BrandName
©©' 0
;
©©0 1
brand
™™ 
.
™™ 
Description
™™ 
=
™™ 
brandDTO
™™  (
.
™™( )
Description
™™) 4
;
™™4 5
brand
´´ 
.
´´ 
LogoUrl
´´ 
=
´´ 
brandDTO
´´ $
.
´´$ %
LogoUrl
´´% ,
;
´´, -
await
≠≠ 
_context
≠≠ 
.
≠≠ 
SaveChangesAsync
≠≠ +
(
≠≠+ ,
)
≠≠, -
;
≠≠- .
return
ÆÆ 
brandDTO
ÆÆ 
;
ÆÆ 
}
ØØ 	
public
±± 
async
±± 
Task
±± 
<
±± 
bool
±± 
>
±± 
DeleteBrandAsync
±±  0
(
±±0 1
int
±±1 4
brandId
±±5 <
)
±±< =
{
≤≤ 	
var
≥≥ 
brand
≥≥ 
=
≥≥ 
await
≥≥ 
_context
≥≥ &
.
≥≥& '
Brands
≥≥' -
.
¥¥ 
	FindAsync
¥¥ 
(
¥¥ 
brandId
¥¥ "
)
¥¥" #
;
¥¥# $
if
∂∂ 
(
∂∂ 
brand
∂∂ 
==
∂∂ 
null
∂∂ 
)
∂∂ 
{
∑∑ 
throw
∏∏ 
new
∏∏ $
BrandNotFoundException
∏∏ 0
(
∏∏0 1
$str
∏∏1 O
)
∏∏O P
;
∏∏P Q
}
ππ 
_context
ªª 
.
ªª 
Brands
ªª 
.
ªª 
Remove
ªª "
(
ªª" #
brand
ªª# (
)
ªª( )
;
ªª) *
await
ºº 
_context
ºº 
.
ºº 
SaveChangesAsync
ºº +
(
ºº+ ,
)
ºº, -
;
ºº- .
return
ΩΩ 
true
ΩΩ 
;
ΩΩ 
}
ææ 	
}
øø 
}¡¡ √
rD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\CartRepository\ICartRepository.cs
	namespace		 	
EcomLib		
 
.		 

Repository		 
.		 
CartRepository		 +
{

 
public 

	interface 
ICartRepository $
{ 
Cart 
GetCartByUserId 
( 
int  
userId! '
)' (
;( )
void 
	AddToCart 
( 
CartItem 
cartItem  (
)( )
;) *
void 

UpdateCart 
( 
Cart 
cart !
)! "
;" #
void 
RemoveFromCart 
( 
int 

cartItemId  *
)* +
;+ ,
void 
Save 
( 
) 
; 
} 
} Ü
qD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\CartRepository\CartRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
CartRepository +
{ 
public 

class 
CartRepository 
:  !
ICartRepository" 1
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public 
CartRepository 
( 
AppDbContext *
context+ 2
)2 3
{ 	
_context 
= 
context 
; 
} 	
public 
Cart 
GetCartByUserId #
(# $
int$ '
userId( .
). /
{ 	
return 
_context 
. 
Carts !
. 
Include 
( 
c 
=> 
c 
.  
	CartItems  )
)) *
. 
ThenInclude 
( 
ci 
=>  "
ci# %
.% &
Product& -
)- .
. 
FirstOrDefault 
(  
c  !
=>" $
c% &
.& '
UserId' -
==. 0
userId1 7
&&8 :
c; <
.< =
IsActive= E
)E F
;F G
} 	
public   
void   
	AddToCart   
(   
CartItem   &
cartItem  ' /
)  / 0
{!! 	
_context"" 
."" 
	CartItems"" 
."" 
Add"" "
(""" #
cartItem""# +
)""+ ,
;"", -
}## 	
public%% 
void%% 

UpdateCart%% 
(%% 
Cart%% #
cart%%$ (
)%%( )
{&& 	
_context'' 
.'' 
Carts'' 
.'' 
Update'' !
(''! "
cart''" &
)''& '
;''' (
}(( 	
public** 
void** 
RemoveFromCart** "
(**" #
int**# &

cartItemId**' 1
)**1 2
{++ 	
var,, 
cartItem,, 
=,, 
_context,, #
.,,# $
	CartItems,,$ -
.,,- .
FirstOrDefault,,. <
(,,< =
ci,,= ?
=>,,@ B
ci,,C E
.,,E F

CartItemId,,F P
==,,Q S

cartItemId,,T ^
),,^ _
;,,_ `
if-- 
(-- 
cartItem-- 
!=-- 
null--  
)--  !
{.. 
_context// 
.// 
	CartItems// "
.//" #
Remove//# )
(//) *
cartItem//* 2
)//2 3
;//3 4
}00 
}11 	
public33 
void33 
Save33 
(33 
)33 
{44 	
_context55 
.55 
SaveChanges55  
(55  !
)55! "
;55" #
}66 	
}77 
}99 Á
éD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\AnalyticsRepository\UserAnalytics\IUserAnalyticsRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
AnalyticsRepository 0
.0 1
	NewFolder1 :
{		 
public

 

	interface

 $
IUserAnalyticsRepository

 -
{ 
int %
GetTotalUserRegistrations %
(% &
)& '
;' (
int '
GetTotalSellerRegistrations '
(' (
)( )
;) *
List 
< 
TopActiveUserDto 
> 
GetTopActiveUsers 0
(0 1
int1 4
topN5 9
)9 :
;: ;
List 
< 
UserActivityLogDto 
>  
GetUserActivityLog! 3
(3 4
)4 5
;5 6
} 
} $
çD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\AnalyticsRepository\UserAnalytics\UserAnalyticsRepository.cs
	namespace

 	
EcomLib


 
.

 

Repository

 
.

 
AnalyticsRepository

 0
{ 
public 

class #
UserAnalyticsRepository (
:) *$
IUserAnalyticsRepository+ C
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public #
UserAnalyticsRepository &
(& '
AppDbContext' 3
context4 ;
); <
{ 	
_context 
= 
context 
; 
} 	
public 
int %
GetTotalUserRegistrations ,
(, -
)- .
{ 	
return 
_context 
. 
Users !
.! "
Count" '
(' (
u( )
=>* ,
u- .
.. /
Role/ 3
==4 6
Ecomlib7 >
.> ?
Models? E
.E F
UserManagemntF S
.S T
UserRoleT \
.\ ]
User] a
)a b
;b c
} 	
public 
int '
GetTotalSellerRegistrations .
(. /
)/ 0
{ 	
return 
_context 
. 
Users !
.! "
Count" '
(' (
u( )
=>* ,
u- .
.. /
Role/ 3
==4 6
Ecomlib7 >
.> ?
Models? E
.E F
UserManagemntF S
.S T
UserRoleT \
.\ ]
Seller] c
)c d
;d e
} 	
public"" 
List"" 
<"" 
TopActiveUserDto"" $
>""$ %
GetTopActiveUsers""& 7
(""7 8
int""8 ;
topN""< @
)""@ A
{## 	
var$$ 
topActiveUsers$$ 
=$$  
($$! "
from$$" &
user$$' +
in$$, .
_context$$/ 7
.$$7 8
Users$$8 =
join%%" &
order%%' ,
in%%- /
_context%%0 8
.%%8 9
Orders%%9 ?
on%%@ B
user%%C G
.%%G H
UserId%%H N
equals%%O U
order%%V [
.%%[ \
UserId%%\ b
group&&" '
user&&( ,
by&&- /
new&&0 3
{&&4 5
user&&6 :
.&&: ;
UserId&&; A
,&&A B
user&&C G
.&&G H
Username&&H P
}&&Q R
into&&S W
	userGroup&&X a
orderby''" )
	userGroup''* 3
.''3 4
Count''4 9
(''9 :
)'': ;

descending''< F
select((" (
new(() ,
TopActiveUserDto((- =
{))" #
UserId**& ,
=**- .
	userGroup**/ 8
.**8 9
Key**9 <
.**< =
UserId**= C
,**C D
UserName++& .
=++/ 0
	userGroup++1 :
.++: ;
Key++; >
.++> ?
Username++? G
,++G H
PurchaseCount,,& 3
=,,4 5
	userGroup,,6 ?
.,,? @
Count,,@ E
(,,E F
),,F G
}--" #
)--# $
.--$ %
Take--% )
(--) *
topN--* .
)--. /
.--/ 0
ToList--0 6
(--6 7
)--7 8
;--8 9
return// 
topActiveUsers// !
;//! "
}00 	
public33 
List33 
<33 
UserActivityLogDto33 &
>33& '
GetUserActivityLog33( :
(33: ;
)33; <
{44 	
var55 
activityLogs55 
=55 
(55  
from55  $
log55% (
in55) +
_context55, 4
.554 5
	AuditLogs555 >
select77  &
new77' *
UserActivityLogDto77+ =
{88  !
Activity99$ ,
=99- .
log99/ 2
.992 3
Action993 9
,999 :
Date::$ (
=::) *
log::+ .
.::. /
	Timestamp::/ 8
.::8 9
ToLongDateString::9 I
(::I J
)::J K
,::K L
Details;;$ +
=;;, -
log;;. 1
.;;1 2
Details;;2 9
}<<  !
)<<! "
.<<" #
ToList<<# )
(<<) *
)<<* +
;<<+ ,
return>> 
activityLogs>> 
;>>  
}?? 	
}@@ 
}BB ü4
ÖD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\AnalyticsRepository\SellerAnalysis\SellerAnalysis.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
AnalyticsRepository 0
.0 1
SellerAnalysis1 ?
{ 
public 

class $
SellerAnalysisRepository )
:* +%
ISellerAnalysisRepository, E
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public $
SellerAnalysisRepository '
(' (
AppDbContext( 4
context5 <
)< =
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
List 
< 
SalesByProductDTO 0
>0 1
>1 2"
GetSalesByProductAsync3 I
(I J
intJ M
sellerIdN V
)V W
{ 	
return 
await 
_context !
.! "

OrderItems" ,
. 
Where 
( 
oi 
=> 
oi 
.  
SellerId  (
==) +
sellerId, 4
)4 5
. 
GroupBy 
( 
oi 
=> 
oi !
.! "
	ProductId" +
)+ ,
. 
Select 
( 
group 
=>  
new! $
SalesByProductDTO% 6
{ 
	ProductId 
= 
group  %
.% &
Key& )
,) *
ProductName 
=  !
group" '
.' (
FirstOrDefault( 6
(6 7
)7 8
.8 9
Product9 @
.@ A
ProductNameA L
,L M
TotalQuantitySold   %
=  & '
group  ( -
.  - .
Sum  . 1
(  1 2
oi  2 4
=>  5 7
oi  8 :
.  : ;
Quantity  ; C
)  C D
,  D E
TotalSalesAmount!! $
=!!% &
group!!' ,
.!!, -
Sum!!- 0
(!!0 1
oi!!1 3
=>!!4 6
oi!!7 9
.!!9 :

TotalPrice!!: D
)!!D E
}"" 
)"" 
.## 
ToListAsync## 
(## 
)## 
;## 
}$$ 	
public'' 
async'' 
Task'' 
<'' 
List'' 
<'' 
SalesByMonthDto'' .
>''. /
>''/ 0 
GetSalesByMonthAsync''1 E
(''E F
int''F I
sellerId''J R
)''R S
{(( 	
return)) 
await)) 
_context)) !
.))! "

OrderItems))" ,
.** 
Where** 
(** 
oi** 
=>** 
oi** 
.**  
SellerId**  (
==**) +
sellerId**, 4
)**4 5
.++ 
GroupBy++ 
(++ 
oi++ 
=>++ 
new++ "
{++# $
oi++% '
.++' (
Order++( -
.++- .
	OrderDate++. 7
.++7 8
Year++8 <
,++< =
oi++> @
.++@ A
Order++A F
.++F G
	OrderDate++G P
.++P Q
Month++Q V
}++W X
)++X Y
.,, 
Select,, 
(,, 
group,, 
=>,,  
new,,! $
SalesByMonthDto,,% 4
{-- 
Year.. 
=.. 
group..  
...  !
Key..! $
...$ %
Year..% )
,..) *
Month// 
=// 
group// !
.//! "
Key//" %
.//% &
Month//& +
,//+ ,
TotalOrders00 
=00  !
group00" '
.00' (
Count00( -
(00- .
)00. /
,00/ 0
TotalSalesAmount11 $
=11% &
group11' ,
.11, -
Sum11- 0
(110 1
oi111 3
=>114 6
oi117 9
.119 :

TotalPrice11: D
)11D E
}22 
)22 
.33 
ToListAsync33 
(33 
)33 
;33 
}44 	
public77 
async77 
Task77 
<77  
TopSellingProductDto77 .
>77. /-
!GetTopSellingProductBySellerAsync770 Q
(77Q R
int77R U
sellerId77V ^
)77^ _
{88 	
return99 
await99 
_context99 !
.99! "

OrderItems99" ,
.:: 
Where:: 
(:: 
oi:: 
=>:: 
oi:: 
.::  
SellerId::  (
==::) +
sellerId::, 4
)::4 5
.;; 
GroupBy;; 
(;; 
oi;; 
=>;; 
new;; "
{;;# $
oi;;% '
.;;' (
	ProductId;;( 1
,;;1 2
oi;;3 5
.;;5 6
Product;;6 =
.;;= >
ProductName;;> I
};;I J
);;J K
.<< 
OrderByDescending<< "
(<<" #
group<<# (
=><<) +
group<<, 1
.<<1 2
Sum<<2 5
(<<5 6
oi<<6 8
=><<9 ;
oi<<< >
.<<> ?
Quantity<<? G
)<<G H
)<<H I
.== 
Select== 
(== 
group== 
=>==  
new==! $ 
TopSellingProductDto==% 9
{>> 
SellerId?? 
=?? 
sellerId?? '
,??' (
	ProductId@@ 
=@@ 
group@@  %
.@@% &
Key@@& )
.@@) *
	ProductId@@* 3
,@@3 4
ProductNameAA 
=AA  !
groupAA" '
.AA' (
KeyAA( +
.AA+ ,
ProductNameAA, 7
,AA7 8
TotalQuantitySoldBB %
=BB& '
groupBB( -
.BB- .
SumBB. 1
(BB1 2
oiBB2 4
=>BB5 7
oiBB8 :
.BB: ;
QuantityBB; C
)BBC D
,BBD E
TotalSalesAmountCC $
=CC% &
groupCC' ,
.CC, -
SumCC- 0
(CC0 1
oiCC1 3
=>CC4 6
oiCC7 9
.CC9 :

TotalPriceCC: D
)CCD E
}DD 
)DD 
.EE 
FirstOrDefaultAsyncEE $
(EE$ %
)EE% &
;EE& '
}FF 	
}GG 
}II ˛
ÜD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\AnalyticsRepository\SellerAnalysis\ISellerAnalysis.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
AnalyticsRepository 0
.0 1
SellerAnalysis1 ?
{		 
public

 

	interface

 %
ISellerAnalysisRepository

 .
{ 
Task 
< 
List 
< 
SalesByProductDTO #
># $
>$ %"
GetSalesByProductAsync& <
(< =
int= @
sellerIdA I
)I J
;J K
Task 
< 
List 
< 
SalesByMonthDto !
>! "
>" # 
GetSalesByMonthAsync$ 8
(8 9
int9 <
sellerId= E
)E F
;F G
Task 
<  
TopSellingProductDto !
>! "-
!GetTopSellingProductBySellerAsync# D
(D E
intE H
sellerIdI Q
)Q R
;R S
} 
} îa
èD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\AnalyticsRepository\SalesAnalytics\SalesAnalyticsRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
AnalyticsRepository 0
.0 1
SalesAnalytics1 ?
{ 
public 

class $
SalesAnalyticsRepository )
:) *%
ISalesAnalyticsRepository+ D
{ 
private 
readonly 
string 
_connectionString  1
;1 2
public $
SalesAnalyticsRepository '
(' (
IConfiguration( 6
configuration7 D
)D E
{ 	
_connectionString 
= 
configuration  -
.- .
GetConnectionString. A
(A B
$strB U
)U V
;V W
} 	
public 
List 
< 
SalesByCategoryDto &
>& '
GetSalesByCategory( :
(: ;
); <
{ 	
var 
result 
= 
new 
List !
<! "
SalesByCategoryDto" 4
>4 5
(5 6
)6 7
;7 8
using 
( 
SqlConnection  
conn! %
=& '
new( +
SqlConnection, 9
(9 :
_connectionString: K
)K L
)L M
{   
conn!! 
.!! 
Open!! 
(!! 
)!! 
;!! 
using"" 
("" 

SqlCommand"" !
cmd""" %
=""& '
new""( +

SqlCommand"", 6
(""6 7
$str""7 K
,""K L
conn""M Q
)""Q R
)""R S
{## 
cmd$$ 
.$$ 
CommandType$$ #
=$$$ %
CommandType$$& 1
.$$1 2
StoredProcedure$$2 A
;$$A B
using&& 
(&& 
SqlDataReader&& (
reader&&) /
=&&0 1
cmd&&2 5
.&&5 6
ExecuteReader&&6 C
(&&C D
)&&D E
)&&E F
{'' 
while(( 
((( 
reader(( %
.((% &
Read((& *
(((* +
)((+ ,
)((, -
{)) 
var** 
dto**  #
=**$ %
new**& )
SalesByCategoryDto*** <
{++ 
CategoryName,,  ,
=,,- .
reader,,/ 5
[,,5 6
$str,,6 D
],,D E
.,,E F
ToString,,F N
(,,N O
),,O P
,,,P Q

TotalSales--  *
=--+ ,
Convert--- 4
.--4 5
	ToDecimal--5 >
(--> ?
reader--? E
[--E F
$str--F R
]--R S
)--S T
}.. 
;.. 
result// "
.//" #
Add//# &
(//& '
dto//' *
)//* +
;//+ ,
}00 
}11 
}22 
}33 
return44 
result44 
;44 
}55 	
public77 
List77 
<77 
SalesByProductDto77 %
>77% &
GetSalesByProduct77' 8
(778 9
)779 :
{88 	
var99 
result99 
=99 
new99 
List99 !
<99! "
SalesByProductDto99" 3
>993 4
(994 5
)995 6
;996 7
using;; 
(;; 
SqlConnection;;  
conn;;! %
=;;& '
new;;( +
SqlConnection;;, 9
(;;9 :
_connectionString;;: K
);;K L
);;L M
{<< 
conn== 
.== 
Open== 
(== 
)== 
;== 
using>> 
(>> 

SqlCommand>> !
cmd>>" %
=>>& '
new>>( +

SqlCommand>>, 6
(>>6 7
$str>>7 J
,>>J K
conn>>L P
)>>P Q
)>>Q R
{?? 
cmd@@ 
.@@ 
CommandType@@ #
=@@$ %
CommandType@@& 1
.@@1 2
StoredProcedure@@2 A
;@@A B
usingBB 
(BB 
SqlDataReaderBB (
readerBB) /
=BB0 1
cmdBB2 5
.BB5 6
ExecuteReaderBB6 C
(BBC D
)BBD E
)BBE F
{CC 
whileDD 
(DD 
readerDD %
.DD% &
ReadDD& *
(DD* +
)DD+ ,
)DD, -
{EE 
varFF 
dtoFF  #
=FF$ %
newFF& )
SalesByProductDtoFF* ;
{GG 
ProductNameHH  +
=HH, -
readerHH. 4
[HH4 5
$strHH5 B
]HHB C
.HHC D
ToStringHHD L
(HHL M
)HHM N
,HHN O

TotalSalesII  *
=II+ ,
ConvertII- 4
.II4 5
	ToDecimalII5 >
(II> ?
readerII? E
[IIE F
$strIIF R
]IIR S
)IIS T
}JJ 
;JJ 
resultKK "
.KK" #
AddKK# &
(KK& '
dtoKK' *
)KK* +
;KK+ ,
}LL 
}MM 
}NN 
}OO 
returnPP 
resultPP 
;PP 
}QQ 	
publicSS 
ListSS 
<SS 
SalesBySellerDtoSS $
>SS$ %
GetSalesBySellerSS& 6
(SS6 7
)SS7 8
{TT 	
varUU 
resultUU 
=UU 
newUU 
ListUU !
<UU! "
SalesBySellerDtoUU" 2
>UU2 3
(UU3 4
)UU4 5
;UU5 6
usingWW 
(WW 
SqlConnectionWW  
connWW! %
=WW& '
newWW( +
SqlConnectionWW, 9
(WW9 :
_connectionStringWW: K
)WWK L
)WWL M
{XX 
connYY 
.YY 
OpenYY 
(YY 
)YY 
;YY 
usingZZ 
(ZZ 

SqlCommandZZ !
cmdZZ" %
=ZZ& '
newZZ( +

SqlCommandZZ, 6
(ZZ6 7
$strZZ7 I
,ZZI J
connZZK O
)ZZO P
)ZZP Q
{[[ 
cmd\\ 
.\\ 
CommandType\\ #
=\\$ %
CommandType\\& 1
.\\1 2
StoredProcedure\\2 A
;\\A B
using^^ 
(^^ 
SqlDataReader^^ (
reader^^) /
=^^0 1
cmd^^2 5
.^^5 6
ExecuteReader^^6 C
(^^C D
)^^D E
)^^E F
{__ 
while`` 
(`` 
reader`` %
.``% &
Read``& *
(``* +
)``+ ,
)``, -
{aa 
varbb 
dtobb  #
=bb$ %
newbb& )
SalesBySellerDtobb* :
{cc 

SellerNamedd  *
=dd+ ,
readerdd- 3
[dd3 4
$strdd4 @
]dd@ A
.ddA B
ToStringddB J
(ddJ K
)ddK L
,ddL M

TotalSalesee  *
=ee+ ,
Convertee- 4
.ee4 5
	ToDecimalee5 >
(ee> ?
readeree? E
[eeE F
$streeF R
]eeR S
)eeS T
}ff 
;ff 
resultgg "
.gg" #
Addgg# &
(gg& '
dtogg' *
)gg* +
;gg+ ,
}hh 
}ii 
}jj 
}kk 
returnll 
resultll 
;ll 
}mm 	
publicoo 
Listoo 
<oo 
DailySalesDtooo !
>oo! "
GetDailySalesoo# 0
(oo0 1
)oo1 2
{pp 	
varqq 
resultqq 
=qq 
newqq 
Listqq !
<qq! "
DailySalesDtoqq" /
>qq/ 0
(qq0 1
)qq1 2
;qq2 3
usingss 
(ss 
SqlConnectionss  
connss! %
=ss& '
newss( +
SqlConnectionss, 9
(ss9 :
_connectionStringss: K
)ssK L
)ssL M
{tt 
connuu 
.uu 
Openuu 
(uu 
)uu 
;uu 
usingvv 
(vv 

SqlCommandvv !
cmdvv" %
=vv& '
newvv( +

SqlCommandvv, 6
(vv6 7
$strvv7 F
,vvF G
connvvH L
)vvL M
)vvM N
{ww 
cmdxx 
.xx 
CommandTypexx #
=xx$ %
CommandTypexx& 1
.xx1 2
StoredProcedurexx2 A
;xxA B
usingzz 
(zz 
SqlDataReaderzz (
readerzz) /
=zz0 1
cmdzz2 5
.zz5 6
ExecuteReaderzz6 C
(zzC D
)zzD E
)zzE F
{{{ 
while|| 
(|| 
reader|| %
.||% &
Read||& *
(||* +
)||+ ,
)||, -
{}} 
var~~ 
dto~~  #
=~~$ %
new~~& )
DailySalesDto~~* 7
{ 
Date
ÄÄ  $
=
ÄÄ% &
Convert
ÄÄ' .
.
ÄÄ. /

ToDateTime
ÄÄ/ 9
(
ÄÄ9 :
reader
ÄÄ: @
[
ÄÄ@ A
$str
ÄÄA G
]
ÄÄG H
)
ÄÄH I
,
ÄÄI J

TotalSales
ÅÅ  *
=
ÅÅ+ ,
Convert
ÅÅ- 4
.
ÅÅ4 5
	ToDecimal
ÅÅ5 >
(
ÅÅ> ?
reader
ÅÅ? E
[
ÅÅE F
$str
ÅÅF R
]
ÅÅR S
)
ÅÅS T
}
ÇÇ 
;
ÇÇ 
result
ÉÉ "
.
ÉÉ" #
Add
ÉÉ# &
(
ÉÉ& '
dto
ÉÉ' *
)
ÉÉ* +
;
ÉÉ+ ,
}
ÑÑ 
}
ÖÖ 
}
ÜÜ 
}
áá 
return
àà 
result
àà 
;
àà 
}
ââ 	
public
ãã 
List
ãã 
<
ãã 
SalesByProductDto
ãã %
>
ãã% &#
GetTopSellingProducts
ãã' <
(
ãã< =
)
ãã= >
{
åå 	
var
çç 
result
çç 
=
çç 
new
çç 
List
çç !
<
çç! "
SalesByProductDto
çç" 3
>
çç3 4
(
çç4 5
)
çç5 6
;
çç6 7
using
èè 
(
èè 
SqlConnection
èè  
conn
èè! %
=
èè& '
new
èè( +
SqlConnection
èè, 9
(
èè9 :
_connectionString
èè: K
)
èèK L
)
èèL M
{
êê 
conn
ëë 
.
ëë 
Open
ëë 
(
ëë 
)
ëë 
;
ëë 
using
íí 
(
íí 

SqlCommand
íí !
cmd
íí" %
=
íí& '
new
íí( +

SqlCommand
íí, 6
(
íí6 7
$str
íí7 N
,
ííN O
conn
ííP T
)
ííT U
)
ííU V
{
ìì 
cmd
îî 
.
îî 
CommandType
îî #
=
îî$ %
CommandType
îî& 1
.
îî1 2
StoredProcedure
îî2 A
;
îîA B
using
ññ 
(
ññ 
SqlDataReader
ññ (
reader
ññ) /
=
ññ0 1
cmd
ññ2 5
.
ññ5 6
ExecuteReader
ññ6 C
(
ññC D
)
ññD E
)
ññE F
{
óó 
while
òò 
(
òò 
reader
òò %
.
òò% &
Read
òò& *
(
òò* +
)
òò+ ,
)
òò, -
{
ôô 
var
öö 
dto
öö  #
=
öö$ %
new
öö& )
SalesByProductDto
öö* ;
{
õõ 
ProductName
úú  +
=
úú, -
reader
úú. 4
[
úú4 5
$str
úú5 B
]
úúB C
.
úúC D
ToString
úúD L
(
úúL M
)
úúM N
,
úúN O

TotalSales
ùù  *
=
ùù+ ,
Convert
ùù- 4
.
ùù4 5
	ToDecimal
ùù5 >
(
ùù> ?
reader
ùù? E
[
ùùE F
$str
ùùF R
]
ùùR S
)
ùùS T
}
ûû 
;
ûû 
result
üü "
.
üü" #
Add
üü# &
(
üü& '
dto
üü' *
)
üü* +
;
üü+ ,
}
†† 
}
°° 
}
¢¢ 
}
££ 
return
§§ 
result
§§ 
;
§§ 
}
•• 	
}
¶¶ 
}™™ Ã	
êD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Repository\AnalyticsRepository\SalesAnalytics\ISalesAnalyticsRepository.cs
	namespace 	
EcomLib
 
. 

Repository 
. 
AnalyticsRepository 0
.0 1
SalesAnalytics1 ?
{		 
public

 

	interface

 %
ISalesAnalyticsRepository

 .
{ 
List 
< 
SalesByCategoryDto 
>  
GetSalesByCategory! 3
(3 4
)4 5
;5 6
List 
< 
SalesByProductDto 
> 
GetSalesByProduct  1
(1 2
)2 3
;3 4
List 
< 
SalesBySellerDto 
> 
GetSalesBySeller /
(/ 0
)0 1
;1 2
List 
< 
DailySalesDto 
> 
GetDailySales )
() *
)* +
;+ ,
List 
< 
SalesByProductDto 
> !
GetTopSellingProducts  5
(5 6
)6 7
;7 8
} 
} π	
XD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\Wishlist.cs
	namespace		 	
EcomLib		
 
.		 
Models		 
{

 
public 

class 
Wishlist 
{ 
public 
int 

WishlistId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
	DateAdded !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
User 
User 
{ 
get 
; 
set  #
;# $
}% &
public 
Product 
Product 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} €
cD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\UserManagement\User.cs
	namespace 	
Ecomlib
 
. 
Models 
. 
UserManagemnt &
{ 
public 

class 
User 
{ 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
PasswordHash "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
UserRole 
Role 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
PersonalDetails 
PersonalDetails .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
SellerDetails 
SellerDetails *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
Address 
Address 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
ICollection 
< 
Cart 
>  
Carts! &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ICollection 
< 
Order  
>  !
Orders" (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public   
ICollection   
<   
ProductReview   (
>  ( )
ProductReviews  * 8
{  9 :
get  ; >
;  > ?
set  @ C
;  C D
}  E F
public!! 
ICollection!! 
<!! 
	OrderItem!! $
>!!$ %

OrderItems!!& 0
{!!1 2
get!!3 6
;!!6 7
set!!8 ;
;!!; <
}!!= >
public"" 
ICollection"" 
<"" 
Wishlist"" #
>""# $
	Wishlists""% .
{""/ 0
get""1 4
;""4 5
set""6 9
;""9 :
}""; <
}## 
public&& 

enum&& 
UserRole&& 
{'' 
Admin(( 
,(( 
Seller)) 
,)) 
User** 
}++ 
}-- Æ
lD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\UserManagement\SellerDetails.cs
	namespace 	
Ecomlib
 
. 
Models 
. 
UserManagemnt &
{ 
public		 

class		 
SellerDetails		 
{

 
public 
int 
SellerId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
CompanyName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string %
CompanyRegistrationNumber /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
string 
	GSTNumber 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
BusinessType "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
User 
User 
{ 
get 
; 
set  #
;# $
}% &
} 
} ≈
nD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\UserManagement\PersonalDetails.cs
	namespace 	
Ecomlib
 
. 
Models 
. 
UserManagemnt &
{ 
public		 

class		 
PersonalDetails		  
{

 
public 
int 
PersonalDetailsId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
DateOfBirth #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
User 
User 
{ 
get 
; 
set  #
;# $
}% &
} 
} ƒ
fD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\UserManagement\Address.cs
	namespace 	
Ecomlib
 
. 
Models 
. 
UserManagemnt &
{ 
public		 

class		 
Address		 
{

 
public 
int 
	AddressId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
AddressLine1 "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
AddressLine2 "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 

PostalCode  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Country 
{ 
get  #
;# $
set% (
;( )
}* +
public 
User 
User 
{ 
get 
; 
set  #
;# $
}% &
} 
} ˆ
]D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\ProductReview.cs
	namespace		 	
	EcomQuitQ		
 
.		 
Models		 
{

 
public 

class 
ProductReview 
{ 
public 
int 
ReviewId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
Rating 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Comment 
{ 
get  #
;# $
set% (
;( )
}* +
public 
DateTime 

ReviewDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
Product 
Product 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
User 
User 
{ 
get 
; 
set  #
;# $
}% &
} 
} ﬂ

lD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\ProductManagment\SubCategory.cs
	namespace 	
EcomLib
 
. 
Models 
. 
ProductManagment )
{ 
public		 

class		 
SubCategory		 
{

 
public 
int 
SubCategoryId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
ParentCategoryId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
SubCategoryName %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
ParentCategory 
ParentCategory ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
ICollection 
< 
Product "
>" #
Products$ ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
} »
hD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\ProductManagment\Product.cs
	namespace 	
EcomLib
 
. 
Models 
. 
ProductManagment )
{ 
public 

class 
Product 
{ 
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
SubCategoryId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
SellerId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
BrandId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
ProductName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
StockQuantity  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
ImageUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
	DateAdded !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
SubCategory 
SubCategory &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
Brand 
Brand 
{ 
get  
;  !
set" %
;% &
}' (
public 
ICollection 
< 
CartItem #
># $
	CartItems% .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public   
ICollection   
<   
	OrderItem   $
>  $ %

OrderItems  & 0
{  1 2
get  3 6
;  6 7
set  8 ;
;  ; <
}  = >
public!! 
	Inventory!! 
	Inventory!! "
{!!# $
get!!% (
;!!( )
set!!* -
;!!- .
}!!/ 0
public"" 
ICollection"" 
<"" 
ProductReview"" (
>""( )
ProductReviews""* 8
{""9 :
get""; >
;""> ?
set""@ C
;""C D
}""E F
public## 
ICollection## 
<## 
ProductDiscount## *
>##* +
ProductDiscounts##, <
{##= >
get##? B
;##B C
set##D G
;##G H
}##I J
public$$ 
User$$ 
Seller$$ 
{$$ 
get$$  
;$$  !
set$$" %
;$$% &
}$$' (
public%% 
ICollection%% 
<%% 
Wishlist%% #
>%%# $
	Wishlists%%% .
{%%/ 0
get%%1 4
;%%4 5
set%%6 9
;%%9 :
}%%; <
}&& 
}(( £
oD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\ProductManagment\ParentCategory.cs
	namespace 	
EcomLib
 
. 
Models 
. 
ProductManagment )
{ 
public		 

class		 
ParentCategory		 
{

 
public 
int 
ParentCategoryId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
CategoryName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
ICollection 
< 
SubCategory &
>& '
SubCategories( 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
} 
} ó	
fD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\ProductManagment\Brand.cs
	namespace 	
EcomLib
 
. 
Models 
. 
ProductManagment )
{ 
public		 

class		 
Brand		 
{

 
public 
int 
BrandId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	BrandName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
LogoUrl 
{ 
get  #
;# $
set% (
;( )
}* +
public 
ICollection 
< 
Product "
>" #
Products$ ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
} ∏
WD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\Payment.cs
	namespace		 	
EcomLib		
 
.		 
Models		 
{

 
public 

class 
Payment 
{ 
public 
int 
	PaymentId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
OrderId 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
PaymentDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
decimal 
PaymentAmount $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
PaymentMethod 
PaymentMethod *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
PaymentStatus 
PaymentStatus *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
Order 
Order 
{ 
get  
;  !
set" %
;% &
}' (
} 
public 

enum 
PaymentMethod 
{ 

CreditCard 
, 
	DebitCard 
, 

NetBanking 
, 
UPI 
, 
COD 
}   
public## 

enum## 
PaymentStatus## 
{$$ 
Pending%% 
,%% 
	Completed&& 
,&& 
Failed'' 
}(( 
}** ñ
iD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\OrderManagement\OrderItem.cs
	namespace		 	
EcomLib		
 
.		 
Models		 
.		 
OrderManagement		 (
{

 
public 

class 
	OrderItem 
{ 
public 
int 
OrderItemId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
OrderId 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
SellerId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
Quantity 
{ 
get !
;! "
set# &
;& '
}( )
public 
decimal 
	UnitPrice  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
decimal 

TotalPrice !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
OrderItemStatus 

ItemStatus )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
Order 
Order 
{ 
get  
;  !
set" %
;% &
}' (
public 
Product 
Product 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
User 
Seller 
{ 
get  
;  !
set" %
;% &
}' (
} 
public 

enum 
OrderItemStatus 
{   
Pending!! 
,!! 
	Processed"" 
,"" 
Shipped## 
,## 
	Delivered$$ 
,$$ 
	Cancelled%% 
}&& 
})) ∏
eD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\OrderManagement\Order.cs
	namespace 	
EcomLib
 
. 
Models 
. 
OrderManagement (
{		 
public

 

class

 
Order

 
{ 
public 
int 
OrderId 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
DateTime 
	OrderDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
TotalAmount "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
ShippingAddressId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
BillingAddressId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
OrderStatus 
OrderStatus &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
User 
User 
{ 
get 
; 
set  #
;# $
}% &
public 
Address 
ShippingAddress &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
Address 
BillingAddress %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
ICollection 
< 
	OrderItem $
>$ %

OrderItems& 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
ICollection 
< 
Payment "
>" #
Payments$ ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
public 

enum 
OrderStatus 
{ 
Pending 
, 
	Processed   
,   
Shipped!! 
,!! 
	Delivered"" 
,"" 
	Cancelled## 
}$$ 
}'' ‘	
YD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\Inventory.cs
	namespace		 	
EcomLib		
 
.		 
Models		 
{

 
public 

class 
	Inventory 
{ 
public 
int 
InventoryId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
QuantityInStock "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
ReorderLevel 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
LastRestockedDate )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
Product 
Product 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ¸
qD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\DiscountManagemnt\ProductDiscount.cs
	namespace 	
EcomLib
 
. 
Models 
. 
DiscountManagement +
{		 
public

 

class

 
ProductDiscount

  
{ 
public 
int 
ProductDiscountId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 

DiscountId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
Product 
Product 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
Discount 
Discount  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ◊
jD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\DiscountManagemnt\Discount.cs
	namespace 	
EcomLib
 
. 
Models 
. 
DiscountManagement +
{ 
public		 

class		 
Discount		 
{

 
public 
int 

DiscountId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
DiscountCode "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DiscountType 
DiscountType (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
decimal 
DiscountValue $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
DateTime 
	StartDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
EndDate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
ICollection 
< 
ProductDiscount *
>* +
ProductDiscounts, <
{= >
get? B
;B C
setD G
;G H
}I J
} 
public 

enum 
DiscountType 
{ 

Percentage 
, 
FixedAmount 
} 
} ™
gD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\CartManagement\CartItem.cs
	namespace		 	
EcomLib		
 
.		 
Models		 
.		 
Cartmanagement		 '
{

 
public 

class 
CartItem 
{ 
public 
int 

CartItemId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
CartId 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
Quantity 
{ 
get !
;! "
set# &
;& '
}( )
public 
decimal 
	UnitPrice  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
decimal 

TotalPrice !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
Cart 
Cart 
{ 
get 
; 
set  #
;# $
}% &
public 
Product 
Product 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ‰
cD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\CartManagement\Cart.cs
	namespace		 	
EcomLib		
 
.		 
Models		 
.		 
Cartmanagement		 '
{

 
public 

class 
Cart 
{ 
public 
int 
CartId 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
decimal 
TotalAmount "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
UpdatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
User 
User 
{ 
get 
; 
set  #
;# $
}% &
public 
ICollection 
< 
CartItem #
># $
	CartItems% .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
} ◊

XD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Models\AuditLog.cs
	namespace 	
EcomLib
 
. 
Models 
{ 
public		 

class		 
AuditLog		 
{

 
public 
int 
LogId 
{ 
get 
; 
set  #
;# $
}% &
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Action 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
TableAffected #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
RecordId 
{ 
get !
;! "
set# &
;& '
}( )
public 
DateTime 
	Timestamp !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Details 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ˛4
sD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Migrations\20241005052619_ChechWishListAdd.cs
	namespace 	
EcomLib
 
. 

Migrations 
{ 
public 

partial 
class 
ChechWishListAdd )
:* +
	Migration, 5
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
DropForeignKey +
(+ ,
name 
: 
$str 6
,6 7
table 
: 
$str !
)! "
;" #
migrationBuilder 
. 
DropForeignKey +
(+ ,
name 
: 
$str 0
,0 1
table 
: 
$str !
)! "
;" #
migrationBuilder 
. 
DropPrimaryKey +
(+ ,
name 
: 
$str #
,# $
table 
: 
$str !
)! "
;" #
migrationBuilder 
. 
RenameTable (
(( )
name 
: 
$str  
,  !
newName 
: 
$str $
)$ %
;% &
migrationBuilder 
. 
RenameIndex (
(( )
name 
: 
$str *
,* +
table 
: 
$str "
," #
newName   
:   
$str   .
)  . /
;  / 0
migrationBuilder"" 
."" 
RenameIndex"" (
(""( )
name## 
:## 
$str## -
,##- .
table$$ 
:$$ 
$str$$ "
,$$" #
newName%% 
:%% 
$str%% 1
)%%1 2
;%%2 3
migrationBuilder'' 
.'' 
AddPrimaryKey'' *
(''* +
name(( 
:(( 
$str(( $
,(($ %
table)) 
:)) 
$str)) "
,))" #
column** 
:** 
$str** $
)**$ %
;**% &
migrationBuilder,, 
.,, 
AddForeignKey,, *
(,,* +
name-- 
:-- 
$str-- 7
,--7 8
table.. 
:.. 
$str.. "
,.." #
column// 
:// 
$str// #
,//# $
principalTable00 
:00 
$str00  *
,00* +
principalColumn11 
:11  
$str11! ,
,11, -
onDelete22 
:22 
ReferentialAction22 +
.22+ ,
Cascade22, 3
)223 4
;224 5
migrationBuilder44 
.44 
AddForeignKey44 *
(44* +
name55 
:55 
$str55 1
,551 2
table66 
:66 
$str66 "
,66" #
column77 
:77 
$str77  
,77  !
principalTable88 
:88 
$str88  '
,88' (
principalColumn99 
:99  
$str99! )
,99) *
onDelete:: 
::: 
ReferentialAction:: +
.::+ ,
Cascade::, 3
)::3 4
;::4 5
};; 	
	protected>> 
override>> 
void>> 
Down>>  $
(>>$ %
MigrationBuilder>>% 5
migrationBuilder>>6 F
)>>F G
{?? 	
migrationBuilder@@ 
.@@ 
DropForeignKey@@ +
(@@+ ,
nameAA 
:AA 
$strAA 7
,AA7 8
tableBB 
:BB 
$strBB "
)BB" #
;BB# $
migrationBuilderDD 
.DD 
DropForeignKeyDD +
(DD+ ,
nameEE 
:EE 
$strEE 1
,EE1 2
tableFF 
:FF 
$strFF "
)FF" #
;FF# $
migrationBuilderHH 
.HH 
DropPrimaryKeyHH +
(HH+ ,
nameII 
:II 
$strII $
,II$ %
tableJJ 
:JJ 
$strJJ "
)JJ" #
;JJ# $
migrationBuilderLL 
.LL 
RenameTableLL (
(LL( )
nameMM 
:MM 
$strMM !
,MM! "
newNameNN 
:NN 
$strNN #
)NN# $
;NN$ %
migrationBuilderPP 
.PP 
RenameIndexPP (
(PP( )
nameQQ 
:QQ 
$strQQ +
,QQ+ ,
tableRR 
:RR 
$strRR !
,RR! "
newNameSS 
:SS 
$strSS -
)SS- .
;SS. /
migrationBuilderUU 
.UU 
RenameIndexUU (
(UU( )
nameVV 
:VV 
$strVV .
,VV. /
tableWW 
:WW 
$strWW !
,WW! "
newNameXX 
:XX 
$strXX 0
)XX0 1
;XX1 2
migrationBuilderZZ 
.ZZ 
AddPrimaryKeyZZ *
(ZZ* +
name[[ 
:[[ 
$str[[ #
,[[# $
table\\ 
:\\ 
$str\\ !
,\\! "
column]] 
:]] 
$str]] $
)]]$ %
;]]% &
migrationBuilder__ 
.__ 
AddForeignKey__ *
(__* +
name`` 
:`` 
$str`` 6
,``6 7
tableaa 
:aa 
$straa !
,aa! "
columnbb 
:bb 
$strbb #
,bb# $
principalTablecc 
:cc 
$strcc  *
,cc* +
principalColumndd 
:dd  
$strdd! ,
,dd, -
onDeleteee 
:ee 
ReferentialActionee +
.ee+ ,
Cascadeee, 3
)ee3 4
;ee4 5
migrationBuildergg 
.gg 
AddForeignKeygg *
(gg* +
namehh 
:hh 
$strhh 0
,hh0 1
tableii 
:ii 
$strii !
,ii! "
columnjj 
:jj 
$strjj  
,jj  !
principalTablekk 
:kk 
$strkk  '
,kk' (
principalColumnll 
:ll  
$strll! )
,ll) *
onDeletemm 
:mm 
ReferentialActionmm +
.mm+ ,
Cascademm, 3
)mm3 4
;mm4 5
}nn 	
}oo 
}pp ©G
pD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Migrations\20241005043811_AddedWishList.cs
	namespace 	
EcomLib
 
. 

Migrations 
{ 
public		 

partial		 
class		 
AddedWishList		 &
:		' (
	Migration		) 2
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
AlterColumn (
<( )
int) ,
>, -
(- .
name 
: 
$str %
,% &
table 
: 
$str !
,! "
type 
: 
$str 
, 
nullable 
: 
false 
,  

oldClrType 
: 
typeof "
(" #
string# )
)) *
,* +
oldType 
: 
$str (
)( )
;) *
migrationBuilder 
. 
AlterColumn (
<( )
int) ,
>, -
(- .
name 
: 
$str %
,% &
table 
: 
$str !
,! "
type 
: 
$str 
, 
nullable 
: 
false 
,  

oldClrType 
: 
typeof "
(" #
string# )
)) *
,* +
oldType 
: 
$str (
)( )
;) *
migrationBuilder 
. 
AlterColumn (
<( )
int) ,
>, -
(- .
name   
:   
$str   #
,  # $
table!! 
:!! 
$str!! 
,!!  
type"" 
:"" 
$str"" 
,"" 
nullable## 
:## 
false## 
,##  

oldClrType$$ 
:$$ 
typeof$$ "
($$" #
string$$# )
)$$) *
,$$* +
oldType%% 
:%% 
$str%% (
)%%( )
;%%) *
migrationBuilder'' 
.'' 
CreateTable'' (
(''( )
name(( 
:(( 
$str((  
,((  !
columns)) 
:)) 
table)) 
=>)) !
new))" %
{** 

WishlistId++ 
=++  
table++! &
.++& '
Column++' -
<++- .
int++. 1
>++1 2
(++2 3
type++3 7
:++7 8
$str++9 >
,++> ?
nullable++@ H
:++H I
false++J O
)++O P
.,, 

Annotation,, #
(,,# $
$str,,$ 8
,,,8 9
$str,,: @
),,@ A
,,,A B
UserId-- 
=-- 
table-- "
.--" #
Column--# )
<--) *
int--* -
>--- .
(--. /
type--/ 3
:--3 4
$str--5 :
,--: ;
nullable--< D
:--D E
false--F K
)--K L
,--L M
	ProductId.. 
=.. 
table..  %
...% &
Column..& ,
<.., -
int..- 0
>..0 1
(..1 2
type..2 6
:..6 7
$str..8 =
,..= >
nullable..? G
:..G H
false..I N
)..N O
,..O P
	DateAdded// 
=// 
table//  %
.//% &
Column//& ,
<//, -
DateTime//- 5
>//5 6
(//6 7
type//7 ;
://; <
$str//= H
,//H I
nullable//J R
://R S
false//T Y
)//Y Z
}00 
,00 
constraints11 
:11 
table11 "
=>11# %
{22 
table33 
.33 

PrimaryKey33 $
(33$ %
$str33% 2
,332 3
x334 5
=>336 8
x339 :
.33: ;

WishlistId33; E
)33E F
;33F G
table44 
.44 

ForeignKey44 $
(44$ %
name55 
:55 
$str55 >
,55> ?
column66 
:66 
x66  !
=>66" $
x66% &
.66& '
	ProductId66' 0
,660 1
principalTable77 &
:77& '
$str77( 2
,772 3
principalColumn88 '
:88' (
$str88) 4
,884 5
onDelete99  
:99  !
ReferentialAction99" 3
.993 4
Cascade994 ;
)99; <
;99< =
table:: 
.:: 

ForeignKey:: $
(::$ %
name;; 
:;; 
$str;; 8
,;;8 9
column<< 
:<< 
x<<  !
=><<" $
x<<% &
.<<& '
UserId<<' -
,<<- .
principalTable== &
:==& '
$str==( /
,==/ 0
principalColumn>> '
:>>' (
$str>>) 1
,>>1 2
onDelete??  
:??  !
ReferentialAction??" 3
.??3 4
Cascade??4 ;
)??; <
;??< =
}@@ 
)@@ 
;@@ 
migrationBuilderBB 
.BB 
CreateIndexBB (
(BB( )
nameCC 
:CC 
$strCC -
,CC- .
tableDD 
:DD 
$strDD !
,DD! "
columnEE 
:EE 
$strEE #
)EE# $
;EE$ %
migrationBuilderGG 
.GG 
CreateIndexGG (
(GG( )
nameHH 
:HH 
$strHH *
,HH* +
tableII 
:II 
$strII !
,II! "
columnJJ 
:JJ 
$strJJ  
)JJ  !
;JJ! "
}KK 	
	protectedNN 
overrideNN 
voidNN 
DownNN  $
(NN$ %
MigrationBuilderNN% 5
migrationBuilderNN6 F
)NNF G
{OO 	
migrationBuilderPP 
.PP 
	DropTablePP &
(PP& '
nameQQ 
:QQ 
$strQQ  
)QQ  !
;QQ! "
migrationBuilderSS 
.SS 
AlterColumnSS (
<SS( )
stringSS) /
>SS/ 0
(SS0 1
nameTT 
:TT 
$strTT %
,TT% &
tableUU 
:UU 
$strUU !
,UU! "
typeVV 
:VV 
$strVV %
,VV% &
nullableWW 
:WW 
falseWW 
,WW  

oldClrTypeXX 
:XX 
typeofXX "
(XX" #
intXX# &
)XX& '
,XX' (
oldTypeYY 
:YY 
$strYY 
)YY 
;YY  
migrationBuilder[[ 
.[[ 
AlterColumn[[ (
<[[( )
string[[) /
>[[/ 0
([[0 1
name\\ 
:\\ 
$str\\ %
,\\% &
table]] 
:]] 
$str]] !
,]]! "
type^^ 
:^^ 
$str^^ %
,^^% &
nullable__ 
:__ 
false__ 
,__  

oldClrType`` 
:`` 
typeof`` "
(``" #
int``# &
)``& '
,``' (
oldTypeaa 
:aa 
$straa 
)aa 
;aa  
migrationBuildercc 
.cc 
AlterColumncc (
<cc( )
stringcc) /
>cc/ 0
(cc0 1
namedd 
:dd 
$strdd #
,dd# $
tableee 
:ee 
$stree 
,ee  
typeff 
:ff 
$strff %
,ff% &
nullablegg 
:gg 
falsegg 
,gg  

oldClrTypehh 
:hh 
typeofhh "
(hh" #
inthh# &
)hh& '
,hh' (
oldTypeii 
:ii 
$strii 
)ii 
;ii  
migrationBuilderkk 
.kk 
	AddColumnkk &
<kk& '
DateTimekk' /
>kk/ 0
(kk0 1
namell 
:ll 
$strll $
,ll$ %
tablemm 
:mm 
$strmm #
,mm# $
typenn 
:nn 
$strnn !
,nn! "
nullableoo 
:oo 
trueoo 
)oo 
;oo  
migrationBuilderqq 
.qq 
	AddColumnqq &
<qq& '
DateTimeqq' /
>qq/ 0
(qq0 1
namerr 
:rr 
$strrr $
,rr$ %
tabless 
:ss 
$strss #
,ss# $
typett 
:tt 
$strtt !
,tt! "
nullableuu 
:uu 
trueuu 
)uu 
;uu  
}vv 	
}ww 
}xx Ø"
uD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Migrations\20241001042306_ChangeOrderRelated.cs
	namespace 	
EcomLib
 
. 

Migrations 
{ 
public 

partial 
class 
ChangeOrderRelated +
:, -
	Migration. 7
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
DropForeignKey +
(+ ,
name 
: 
$str 8
,8 9
table 
: 
$str #
)# $
;$ %
migrationBuilder 
. 
	AddColumn &
<& '
int' *
>* +
(+ ,
name 
: 
$str 
, 
table 
: 
$str #
,# $
type 
: 
$str 
, 
nullable 
: 
true 
) 
;  
migrationBuilder 
. 
CreateIndex (
(( )
name 
: 
$str ,
,, -
table 
: 
$str #
,# $
column 
: 
$str  
)  !
;! "
migrationBuilder   
.   
AddForeignKey   *
(  * +
name!! 
:!! 
$str!! 8
,!!8 9
table"" 
:"" 
$str"" #
,""# $
column## 
:## 
$str## #
,### $
principalTable$$ 
:$$ 
$str$$  *
,$$* +
principalColumn%% 
:%%  
$str%%! ,
,%%, -
onDelete&& 
:&& 
ReferentialAction&& +
.&&+ ,
Restrict&&, 4
)&&4 5
;&&5 6
migrationBuilder)) 
.)) 
AddForeignKey)) *
())* +
name** 
:** 
$str** 2
,**2 3
table++ 
:++ 
$str++ #
,++# $
column,, 
:,, 
$str,,  
,,,  !
principalTable-- 
:-- 
$str--  '
,--' (
principalColumn.. 
:..  
$str..! )
,..) *
onDelete// 
:// 
ReferentialAction// +
.//+ ,
Restrict//, 4
)//4 5
;//5 6
}00 	
	protected33 
override33 
void33 
Down33  $
(33$ %
MigrationBuilder33% 5
migrationBuilder336 F
)33F G
{44 	
migrationBuilder66 
.66 
DropForeignKey66 +
(66+ ,
name77 
:77 
$str77 8
,778 9
table88 
:88 
$str88 #
)88# $
;88$ %
migrationBuilder;; 
.;; 
DropForeignKey;; +
(;;+ ,
name<< 
:<< 
$str<< 2
,<<2 3
table== 
:== 
$str== #
)==# $
;==$ %
migrationBuilder@@ 
.@@ 
	DropIndex@@ &
(@@& '
nameAA 
:AA 
$strAA ,
,AA, -
tableBB 
:BB 
$strBB #
)BB# $
;BB$ %
migrationBuilderEE 
.EE 

DropColumnEE '
(EE' (
nameFF 
:FF 
$strFF 
,FF 
tableGG 
:GG 
$strGG #
)GG# $
;GG$ %
migrationBuilderJJ 
.JJ 
AddForeignKeyJJ *
(JJ* +
nameKK 
:KK 
$strKK 8
,KK8 9
tableLL 
:LL 
$strLL #
,LL# $
columnMM 
:MM 
$strMM #
,MM# $
principalTableNN 
:NN 
$strNN  *
,NN* +
principalColumnOO 
:OO  
$strOO! ,
,OO, -
onDeletePP 
:PP 
ReferentialActionPP +
.PP+ ,
CascadePP, 3
)PP3 4
;PP4 5
}QQ 	
}RR 
}TT ôÿ
mD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Migrations\20240913055509_InitCreate.cs
	namespace 	
EcomLib
 
. 

Migrations 
{ 
public		 

partial		 
class		 

InitCreate		 #
:		$ %
	Migration		& /
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str !
,! "
columns 
: 
table 
=> !
new" %
{ 
LogId 
= 
table !
.! "
Column" (
<( )
int) ,
>, -
(- .
type. 2
:2 3
$str4 9
,9 :
nullable; C
:C D
falseE J
)J K
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
UserId 
= 
table "
." #
Column# )
<) *
int* -
>- .
(. /
type/ 3
:3 4
$str5 :
,: ;
nullable< D
:D E
falseF K
)K L
,L M
Action 
= 
table "
." #
Column# )
<) *
string* 0
>0 1
(1 2
type2 6
:6 7
$str8 G
,G H
nullableI Q
:Q R
falseS X
)X Y
,Y Z
TableAffected !
=" #
table$ )
.) *
Column* 0
<0 1
string1 7
>7 8
(8 9
type9 =
:= >
$str? N
,N O
nullableP X
:X Y
falseZ _
)_ `
,` a
RecordId 
= 
table $
.$ %
Column% +
<+ ,
int, /
>/ 0
(0 1
type1 5
:5 6
$str7 <
,< =
nullable> F
:F G
falseH M
)M N
,N O
	Timestamp 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= H
,H I
nullableJ R
:R S
falseT Y
)Y Z
,Z [
Details 
= 
table #
.# $
Column$ *
<* +
string+ 1
>1 2
(2 3
type3 7
:7 8
$str9 H
,H I
nullableJ R
:R S
falseT Y
)Y Z
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 3
,3 4
x5 6
=>7 9
x: ;
.; <
LogId< A
)A B
;B C
} 
) 
; 
migrationBuilder   
.   
CreateTable   (
(  ( )
name!! 
:!! 
$str!! 
,!! 
columns"" 
:"" 
table"" 
=>"" !
new""" %
{## 
BrandId$$ 
=$$ 
table$$ #
.$$# $
Column$$$ *
<$$* +
int$$+ .
>$$. /
($$/ 0
type$$0 4
:$$4 5
$str$$6 ;
,$$; <
nullable$$= E
:$$E F
false$$G L
)$$L M
.%% 

Annotation%% #
(%%# $
$str%%$ 8
,%%8 9
$str%%: @
)%%@ A
,%%A B
	BrandName&& 
=&& 
table&&  %
.&&% &
Column&&& ,
<&&, -
string&&- 3
>&&3 4
(&&4 5
type&&5 9
:&&9 :
$str&&; J
,&&J K
nullable&&L T
:&&T U
false&&V [
)&&[ \
,&&\ ]
Description'' 
=''  !
table''" '
.''' (
Column''( .
<''. /
string''/ 5
>''5 6
(''6 7
type''7 ;
:''; <
$str''= L
,''L M
nullable''N V
:''V W
false''X ]
)''] ^
,''^ _
LogoUrl(( 
=(( 
table(( #
.((# $
Column(($ *
<((* +
string((+ 1
>((1 2
(((2 3
type((3 7
:((7 8
$str((9 H
,((H I
nullable((J R
:((R S
false((T Y
)((Y Z
})) 
,)) 
constraints** 
:** 
table** "
=>**# %
{++ 
table,, 
.,, 

PrimaryKey,, $
(,,$ %
$str,,% 0
,,,0 1
x,,2 3
=>,,4 6
x,,7 8
.,,8 9
BrandId,,9 @
),,@ A
;,,A B
}-- 
)-- 
;-- 
migrationBuilder// 
.// 
CreateTable// (
(//( )
name00 
:00 
$str00 !
,00! "
columns11 
:11 
table11 
=>11 !
new11" %
{22 

DiscountId33 
=33  
table33! &
.33& '
Column33' -
<33- .
int33. 1
>331 2
(332 3
type333 7
:337 8
$str339 >
,33> ?
nullable33@ H
:33H I
false33J O
)33O P
.44 

Annotation44 #
(44# $
$str44$ 8
,448 9
$str44: @
)44@ A
,44A B
DiscountCode55  
=55! "
table55# (
.55( )
Column55) /
<55/ 0
string550 6
>556 7
(557 8
type558 <
:55< =
$str55> M
,55M N
nullable55O W
:55W X
false55Y ^
)55^ _
,55_ `
Description66 
=66  !
table66" '
.66' (
Column66( .
<66. /
string66/ 5
>665 6
(666 7
type667 ;
:66; <
$str66= L
,66L M
nullable66N V
:66V W
false66X ]
)66] ^
,66^ _
DiscountType77  
=77! "
table77# (
.77( )
Column77) /
<77/ 0
int770 3
>773 4
(774 5
type775 9
:779 :
$str77; @
,77@ A
nullable77B J
:77J K
false77L Q
)77Q R
,77R S
DiscountValue88 !
=88" #
table88$ )
.88) *
Column88* 0
<880 1
decimal881 8
>888 9
(889 :
type88: >
:88> ?
$str88@ O
,88O P
nullable88Q Y
:88Y Z
false88[ `
)88` a
,88a b
	StartDate99 
=99 
table99  %
.99% &
Column99& ,
<99, -
DateTime99- 5
>995 6
(996 7
type997 ;
:99; <
$str99= H
,99H I
nullable99J R
:99R S
false99T Y
)99Y Z
,99Z [
EndDate:: 
=:: 
table:: #
.::# $
Column::$ *
<::* +
DateTime::+ 3
>::3 4
(::4 5
type::5 9
:::9 :
$str::; F
,::F G
nullable::H P
:::P Q
false::R W
)::W X
,::X Y
IsActive;; 
=;; 
table;; $
.;;$ %
Column;;% +
<;;+ ,
bool;;, 0
>;;0 1
(;;1 2
type;;2 6
:;;6 7
$str;;8 =
,;;= >
nullable;;? G
:;;G H
false;;I N
);;N O
}<< 
,<< 
constraints== 
:== 
table== "
=>==# %
{>> 
table?? 
.?? 

PrimaryKey?? $
(??$ %
$str??% 3
,??3 4
x??5 6
=>??7 9
x??: ;
.??; <

DiscountId??< F
)??F G
;??G H
}@@ 
)@@ 
;@@ 
migrationBuilderBB 
.BB 
CreateTableBB (
(BB( )
nameCC 
:CC 
$strCC !
,CC! "
columnsDD 
:DD 
tableDD 
=>DD !
newDD" %
{EE 
ErrorIdFF 
=FF 
tableFF #
.FF# $
ColumnFF$ *
<FF* +
intFF+ .
>FF. /
(FF/ 0
typeFF0 4
:FF4 5
$strFF6 ;
,FF; <
nullableFF= E
:FFE F
falseFFG L
)FFL M
.GG 

AnnotationGG #
(GG# $
$strGG$ 8
,GG8 9
$strGG: @
)GG@ A
,GGA B
ErrorMessageHH  
=HH! "
tableHH# (
.HH( )
ColumnHH) /
<HH/ 0
stringHH0 6
>HH6 7
(HH7 8
typeHH8 <
:HH< =
$strHH> M
,HHM N
nullableHHO W
:HHW X
falseHHY ^
)HH^ _
,HH_ `

StackTraceII 
=II  
tableII! &
.II& '
ColumnII' -
<II- .
stringII. 4
>II4 5
(II5 6
typeII6 :
:II: ;
$strII< K
,IIK L
nullableIIM U
:IIU V
falseIIW \
)II\ ]
,II] ^
	ErrorDateJJ 
=JJ 
tableJJ  %
.JJ% &
ColumnJJ& ,
<JJ, -
DateTimeJJ- 5
>JJ5 6
(JJ6 7
typeJJ7 ;
:JJ; <
$strJJ= H
,JJH I
nullableJJJ R
:JJR S
falseJJT Y
)JJY Z
}KK 
,KK 
constraintsLL 
:LL 
tableLL "
=>LL# %
{MM 
tableNN 
.NN 

PrimaryKeyNN $
(NN$ %
$strNN% 3
,NN3 4
xNN5 6
=>NN7 9
xNN: ;
.NN; <
ErrorIdNN< C
)NNC D
;NND E
}OO 
)OO 
;OO 
migrationBuilderQQ 
.QQ 
CreateTableQQ (
(QQ( )
nameRR 
:RR 
$strRR (
,RR( )
columnsSS 
:SS 
tableSS 
=>SS !
newSS" %
{TT 
ParentCategoryIdUU $
=UU% &
tableUU' ,
.UU, -
ColumnUU- 3
<UU3 4
intUU4 7
>UU7 8
(UU8 9
typeUU9 =
:UU= >
$strUU? D
,UUD E
nullableUUF N
:UUN O
falseUUP U
)UUU V
.VV 

AnnotationVV #
(VV# $
$strVV$ 8
,VV8 9
$strVV: @
)VV@ A
,VVA B
CategoryNameWW  
=WW! "
tableWW# (
.WW( )
ColumnWW) /
<WW/ 0
stringWW0 6
>WW6 7
(WW7 8
typeWW8 <
:WW< =
$strWW> M
,WWM N
nullableWWO W
:WWW X
falseWWY ^
)WW^ _
,WW_ `
DescriptionXX 
=XX  !
tableXX" '
.XX' (
ColumnXX( .
<XX. /
stringXX/ 5
>XX5 6
(XX6 7
typeXX7 ;
:XX; <
$strXX= L
,XXL M
nullableXXN V
:XXV W
falseXXX ]
)XX] ^
}YY 
,YY 
constraintsZZ 
:ZZ 
tableZZ "
=>ZZ# %
{[[ 
table\\ 
.\\ 

PrimaryKey\\ $
(\\$ %
$str\\% :
,\\: ;
x\\< =
=>\\> @
x\\A B
.\\B C
ParentCategoryId\\C S
)\\S T
;\\T U
}]] 
)]] 
;]] 
migrationBuilder__ 
.__ 
CreateTable__ (
(__( )
name`` 
:`` 
$str`` 
,`` 
columnsaa 
:aa 
tableaa 
=>aa !
newaa" %
{bb 
UserIdcc 
=cc 
tablecc "
.cc" #
Columncc# )
<cc) *
intcc* -
>cc- .
(cc. /
typecc/ 3
:cc3 4
$strcc5 :
,cc: ;
nullablecc< D
:ccD E
falseccF K
)ccK L
.dd 

Annotationdd #
(dd# $
$strdd$ 8
,dd8 9
$strdd: @
)dd@ A
,ddA B
Usernameee 
=ee 
tableee $
.ee$ %
Columnee% +
<ee+ ,
stringee, 2
>ee2 3
(ee3 4
typeee4 8
:ee8 9
$stree: I
,eeI J
nullableeeK S
:eeS T
falseeeU Z
)eeZ [
,ee[ \
PasswordHashff  
=ff! "
tableff# (
.ff( )
Columnff) /
<ff/ 0
stringff0 6
>ff6 7
(ff7 8
typeff8 <
:ff< =
$strff> M
,ffM N
nullableffO W
:ffW X
falseffY ^
)ff^ _
,ff_ `
Emailgg 
=gg 
tablegg !
.gg! "
Columngg" (
<gg( )
stringgg) /
>gg/ 0
(gg0 1
typegg1 5
:gg5 6
$strgg7 F
,ggF G
nullableggH P
:ggP Q
falseggR W
)ggW X
,ggX Y
Rolehh 
=hh 
tablehh  
.hh  !
Columnhh! '
<hh' (
inthh( +
>hh+ ,
(hh, -
typehh- 1
:hh1 2
$strhh3 8
,hh8 9
nullablehh: B
:hhB C
falsehhD I
)hhI J
,hhJ K
DateCreatedii 
=ii  !
tableii" '
.ii' (
Columnii( .
<ii. /
DateTimeii/ 7
>ii7 8
(ii8 9
typeii9 =
:ii= >
$strii? J
,iiJ K
nullableiiL T
:iiT U
falseiiV [
)ii[ \
,ii\ ]
IsActivejj 
=jj 
tablejj $
.jj$ %
Columnjj% +
<jj+ ,
booljj, 0
>jj0 1
(jj1 2
typejj2 6
:jj6 7
$strjj8 =
,jj= >
nullablejj? G
:jjG H
falsejjI N
)jjN O
}kk 
,kk 
constraintsll 
:ll 
tablell "
=>ll# %
{mm 
tablenn 
.nn 

PrimaryKeynn $
(nn$ %
$strnn% /
,nn/ 0
xnn1 2
=>nn3 5
xnn6 7
.nn7 8
UserIdnn8 >
)nn> ?
;nn? @
}oo 
)oo 
;oo 
migrationBuilderqq 
.qq 
CreateTableqq (
(qq( )
namerr 
:rr 
$strrr %
,rr% &
columnsss 
:ss 
tabless 
=>ss !
newss" %
{tt 
SubCategoryIduu !
=uu" #
tableuu$ )
.uu) *
Columnuu* 0
<uu0 1
intuu1 4
>uu4 5
(uu5 6
typeuu6 :
:uu: ;
$struu< A
,uuA B
nullableuuC K
:uuK L
falseuuM R
)uuR S
.vv 

Annotationvv #
(vv# $
$strvv$ 8
,vv8 9
$strvv: @
)vv@ A
,vvA B
ParentCategoryIdww $
=ww% &
tableww' ,
.ww, -
Columnww- 3
<ww3 4
intww4 7
>ww7 8
(ww8 9
typeww9 =
:ww= >
$strww? D
,wwD E
nullablewwF N
:wwN O
falsewwP U
)wwU V
,wwV W
SubCategoryNamexx #
=xx$ %
tablexx& +
.xx+ ,
Columnxx, 2
<xx2 3
stringxx3 9
>xx9 :
(xx: ;
typexx; ?
:xx? @
$strxxA P
,xxP Q
nullablexxR Z
:xxZ [
falsexx\ a
)xxa b
,xxb c
Descriptionyy 
=yy  !
tableyy" '
.yy' (
Columnyy( .
<yy. /
stringyy/ 5
>yy5 6
(yy6 7
typeyy7 ;
:yy; <
$stryy= L
,yyL M
nullableyyN V
:yyV W
falseyyX ]
)yy] ^
}zz 
,zz 
constraints{{ 
:{{ 
table{{ "
=>{{# %
{|| 
table}} 
.}} 

PrimaryKey}} $
(}}$ %
$str}}% 7
,}}7 8
x}}9 :
=>}}; =
x}}> ?
.}}? @
SubCategoryId}}@ M
)}}M N
;}}N O
table~~ 
.~~ 

ForeignKey~~ $
(~~$ %
name 
: 
$str R
,R S
column
ÄÄ 
:
ÄÄ 
x
ÄÄ  !
=>
ÄÄ" $
x
ÄÄ% &
.
ÄÄ& '
ParentCategoryId
ÄÄ' 7
,
ÄÄ7 8
principalTable
ÅÅ &
:
ÅÅ& '
$str
ÅÅ( :
,
ÅÅ: ;
principalColumn
ÇÇ '
:
ÇÇ' (
$str
ÇÇ) ;
,
ÇÇ; <
onDelete
ÉÉ  
:
ÉÉ  !
ReferentialAction
ÉÉ" 3
.
ÉÉ3 4
Restrict
ÉÉ4 <
)
ÉÉ< =
;
ÉÉ= >
}
ÑÑ 
)
ÑÑ 
;
ÑÑ 
migrationBuilder
ÜÜ 
.
ÜÜ 
CreateTable
ÜÜ (
(
ÜÜ( )
name
áá 
:
áá 
$str
áá !
,
áá! "
columns
àà 
:
àà 
table
àà 
=>
àà !
new
àà" %
{
ââ 
	AddressId
ää 
=
ää 
table
ää  %
.
ää% &
Column
ää& ,
<
ää, -
int
ää- 0
>
ää0 1
(
ää1 2
type
ää2 6
:
ää6 7
$str
ää8 =
,
ää= >
nullable
ää? G
:
ääG H
false
ääI N
)
ääN O
.
ãã 

Annotation
ãã #
(
ãã# $
$str
ãã$ 8
,
ãã8 9
$str
ãã: @
)
ãã@ A
,
ããA B
UserId
åå 
=
åå 
table
åå "
.
åå" #
Column
åå# )
<
åå) *
int
åå* -
>
åå- .
(
åå. /
type
åå/ 3
:
åå3 4
$str
åå5 :
,
åå: ;
nullable
åå< D
:
ååD E
false
ååF K
)
ååK L
,
ååL M
AddressLine1
çç  
=
çç! "
table
çç# (
.
çç( )
Column
çç) /
<
çç/ 0
string
çç0 6
>
çç6 7
(
çç7 8
type
çç8 <
:
çç< =
$str
çç> M
,
ççM N
nullable
ççO W
:
ççW X
false
ççY ^
)
çç^ _
,
çç_ `
AddressLine2
éé  
=
éé! "
table
éé# (
.
éé( )
Column
éé) /
<
éé/ 0
string
éé0 6
>
éé6 7
(
éé7 8
type
éé8 <
:
éé< =
$str
éé> M
,
ééM N
nullable
ééO W
:
ééW X
false
ééY ^
)
éé^ _
,
éé_ `
City
èè 
=
èè 
table
èè  
.
èè  !
Column
èè! '
<
èè' (
string
èè( .
>
èè. /
(
èè/ 0
type
èè0 4
:
èè4 5
$str
èè6 E
,
èèE F
nullable
èèG O
:
èèO P
false
èèQ V
)
èèV W
,
èèW X
State
êê 
=
êê 
table
êê !
.
êê! "
Column
êê" (
<
êê( )
string
êê) /
>
êê/ 0
(
êê0 1
type
êê1 5
:
êê5 6
$str
êê7 F
,
êêF G
nullable
êêH P
:
êêP Q
false
êêR W
)
êêW X
,
êêX Y

PostalCode
ëë 
=
ëë  
table
ëë! &
.
ëë& '
Column
ëë' -
<
ëë- .
string
ëë. 4
>
ëë4 5
(
ëë5 6
type
ëë6 :
:
ëë: ;
$str
ëë< K
,
ëëK L
nullable
ëëM U
:
ëëU V
false
ëëW \
)
ëë\ ]
,
ëë] ^
Country
íí 
=
íí 
table
íí #
.
íí# $
Column
íí$ *
<
íí* +
string
íí+ 1
>
íí1 2
(
íí2 3
type
íí3 7
:
íí7 8
$str
íí9 H
,
ííH I
nullable
ííJ R
:
ííR S
false
ííT Y
)
ííY Z
}
ìì 
,
ìì 
constraints
îî 
:
îî 
table
îî "
=>
îî# %
{
ïï 
table
ññ 
.
ññ 

PrimaryKey
ññ $
(
ññ$ %
$str
ññ% 3
,
ññ3 4
x
ññ5 6
=>
ññ7 9
x
ññ: ;
.
ññ; <
	AddressId
ññ< E
)
ññE F
;
ññF G
table
óó 
.
óó 

ForeignKey
óó $
(
óó$ %
name
òò 
:
òò 
$str
òò 9
,
òò9 :
column
ôô 
:
ôô 
x
ôô  !
=>
ôô" $
x
ôô% &
.
ôô& '
UserId
ôô' -
,
ôô- .
principalTable
öö &
:
öö& '
$str
öö( /
,
öö/ 0
principalColumn
õõ '
:
õõ' (
$str
õõ) 1
,
õõ1 2
onDelete
úú  
:
úú  !
ReferentialAction
úú" 3
.
úú3 4
Cascade
úú4 ;
)
úú; <
;
úú< =
}
ùù 
)
ùù 
;
ùù 
migrationBuilder
üü 
.
üü 
CreateTable
üü (
(
üü( )
name
†† 
:
†† 
$str
†† 
,
†† 
columns
°° 
:
°° 
table
°° 
=>
°° !
new
°°" %
{
¢¢ 
CartId
££ 
=
££ 
table
££ "
.
££" #
Column
££# )
<
££) *
int
££* -
>
££- .
(
££. /
type
££/ 3
:
££3 4
$str
££5 :
,
££: ;
nullable
££< D
:
££D E
false
££F K
)
££K L
.
§§ 

Annotation
§§ #
(
§§# $
$str
§§$ 8
,
§§8 9
$str
§§: @
)
§§@ A
,
§§A B
UserId
•• 
=
•• 
table
•• "
.
••" #
Column
••# )
<
••) *
int
••* -
>
••- .
(
••. /
type
••/ 3
:
••3 4
$str
••5 :
,
••: ;
nullable
••< D
:
••D E
false
••F K
)
••K L
,
••L M
TotalAmount
¶¶ 
=
¶¶  !
table
¶¶" '
.
¶¶' (
Column
¶¶( .
<
¶¶. /
decimal
¶¶/ 6
>
¶¶6 7
(
¶¶7 8
type
¶¶8 <
:
¶¶< =
$str
¶¶> M
,
¶¶M N
nullable
¶¶O W
:
¶¶W X
false
¶¶Y ^
)
¶¶^ _
,
¶¶_ `
DateCreated
ßß 
=
ßß  !
table
ßß" '
.
ßß' (
Column
ßß( .
<
ßß. /
DateTime
ßß/ 7
>
ßß7 8
(
ßß8 9
type
ßß9 =
:
ßß= >
$str
ßß? J
,
ßßJ K
nullable
ßßL T
:
ßßT U
false
ßßV [
)
ßß[ \
,
ßß\ ]
IsActive
®® 
=
®® 
table
®® $
.
®®$ %
Column
®®% +
<
®®+ ,
bool
®®, 0
>
®®0 1
(
®®1 2
type
®®2 6
:
®®6 7
$str
®®8 =
,
®®= >
nullable
®®? G
:
®®G H
false
®®I N
)
®®N O
,
®®O P
UpdatedDate
©© 
=
©©  !
table
©©" '
.
©©' (
Column
©©( .
<
©©. /
DateTime
©©/ 7
>
©©7 8
(
©©8 9
type
©©9 =
:
©©= >
$str
©©? J
,
©©J K
nullable
©©L T
:
©©T U
false
©©V [
)
©©[ \
}
™™ 
,
™™ 
constraints
´´ 
:
´´ 
table
´´ "
=>
´´# %
{
¨¨ 
table
≠≠ 
.
≠≠ 

PrimaryKey
≠≠ $
(
≠≠$ %
$str
≠≠% /
,
≠≠/ 0
x
≠≠1 2
=>
≠≠3 5
x
≠≠6 7
.
≠≠7 8
CartId
≠≠8 >
)
≠≠> ?
;
≠≠? @
table
ÆÆ 
.
ÆÆ 

ForeignKey
ÆÆ $
(
ÆÆ$ %
name
ØØ 
:
ØØ 
$str
ØØ 5
,
ØØ5 6
column
∞∞ 
:
∞∞ 
x
∞∞  !
=>
∞∞" $
x
∞∞% &
.
∞∞& '
UserId
∞∞' -
,
∞∞- .
principalTable
±± &
:
±±& '
$str
±±( /
,
±±/ 0
principalColumn
≤≤ '
:
≤≤' (
$str
≤≤) 1
,
≤≤1 2
onDelete
≥≥  
:
≥≥  !
ReferentialAction
≥≥" 3
.
≥≥3 4
Cascade
≥≥4 ;
)
≥≥; <
;
≥≥< =
}
¥¥ 
)
¥¥ 
;
¥¥ 
migrationBuilder
∂∂ 
.
∂∂ 
CreateTable
∂∂ (
(
∂∂( )
name
∑∑ 
:
∑∑ 
$str
∑∑ '
,
∑∑' (
columns
∏∏ 
:
∏∏ 
table
∏∏ 
=>
∏∏ !
new
∏∏" %
{
ππ 
PersonalDetailsId
∫∫ %
=
∫∫& '
table
∫∫( -
.
∫∫- .
Column
∫∫. 4
<
∫∫4 5
int
∫∫5 8
>
∫∫8 9
(
∫∫9 :
type
∫∫: >
:
∫∫> ?
$str
∫∫@ E
,
∫∫E F
nullable
∫∫G O
:
∫∫O P
false
∫∫Q V
)
∫∫V W
.
ªª 

Annotation
ªª #
(
ªª# $
$str
ªª$ 8
,
ªª8 9
$str
ªª: @
)
ªª@ A
,
ªªA B
UserId
ºº 
=
ºº 
table
ºº "
.
ºº" #
Column
ºº# )
<
ºº) *
int
ºº* -
>
ºº- .
(
ºº. /
type
ºº/ 3
:
ºº3 4
$str
ºº5 :
,
ºº: ;
nullable
ºº< D
:
ººD E
false
ººF K
)
ººK L
,
ººL M
	FirstName
ΩΩ 
=
ΩΩ 
table
ΩΩ  %
.
ΩΩ% &
Column
ΩΩ& ,
<
ΩΩ, -
string
ΩΩ- 3
>
ΩΩ3 4
(
ΩΩ4 5
type
ΩΩ5 9
:
ΩΩ9 :
$str
ΩΩ; J
,
ΩΩJ K
nullable
ΩΩL T
:
ΩΩT U
false
ΩΩV [
)
ΩΩ[ \
,
ΩΩ\ ]
LastName
ææ 
=
ææ 
table
ææ $
.
ææ$ %
Column
ææ% +
<
ææ+ ,
string
ææ, 2
>
ææ2 3
(
ææ3 4
type
ææ4 8
:
ææ8 9
$str
ææ: I
,
ææI J
nullable
ææK S
:
ææS T
false
ææU Z
)
ææZ [
,
ææ[ \
Gender
øø 
=
øø 
table
øø "
.
øø" #
Column
øø# )
<
øø) *
string
øø* 0
>
øø0 1
(
øø1 2
type
øø2 6
:
øø6 7
$str
øø8 G
,
øøG H
nullable
øøI Q
:
øøQ R
false
øøS X
)
øøX Y
,
øøY Z
DateOfBirth
¿¿ 
=
¿¿  !
table
¿¿" '
.
¿¿' (
Column
¿¿( .
<
¿¿. /
DateTime
¿¿/ 7
>
¿¿7 8
(
¿¿8 9
type
¿¿9 =
:
¿¿= >
$str
¿¿? J
,
¿¿J K
nullable
¿¿L T
:
¿¿T U
false
¿¿V [
)
¿¿[ \
,
¿¿\ ]
PhoneNumber
¡¡ 
=
¡¡  !
table
¡¡" '
.
¡¡' (
Column
¡¡( .
<
¡¡. /
string
¡¡/ 5
>
¡¡5 6
(
¡¡6 7
type
¡¡7 ;
:
¡¡; <
$str
¡¡= L
,
¡¡L M
nullable
¡¡N V
:
¡¡V W
false
¡¡X ]
)
¡¡] ^
}
¬¬ 
,
¬¬ 
constraints
√√ 
:
√√ 
table
√√ "
=>
√√# %
{
ƒƒ 
table
≈≈ 
.
≈≈ 

PrimaryKey
≈≈ $
(
≈≈$ %
$str
≈≈% 9
,
≈≈9 :
x
≈≈; <
=>
≈≈= ?
x
≈≈@ A
.
≈≈A B
PersonalDetailsId
≈≈B S
)
≈≈S T
;
≈≈T U
table
∆∆ 
.
∆∆ 

ForeignKey
∆∆ $
(
∆∆$ %
name
«« 
:
«« 
$str
«« ?
,
««? @
column
»» 
:
»» 
x
»»  !
=>
»»" $
x
»»% &
.
»»& '
UserId
»»' -
,
»»- .
principalTable
…… &
:
……& '
$str
……( /
,
……/ 0
principalColumn
   '
:
  ' (
$str
  ) 1
,
  1 2
onDelete
ÀÀ  
:
ÀÀ  !
ReferentialAction
ÀÀ" 3
.
ÀÀ3 4
Cascade
ÀÀ4 ;
)
ÀÀ; <
;
ÀÀ< =
}
ÃÃ 
)
ÃÃ 
;
ÃÃ 
migrationBuilder
ŒŒ 
.
ŒŒ 
CreateTable
ŒŒ (
(
ŒŒ( )
name
œœ 
:
œœ 
$str
œœ %
,
œœ% &
columns
–– 
:
–– 
table
–– 
=>
–– !
new
––" %
{
—— 
SellerId
““ 
=
““ 
table
““ $
.
““$ %
Column
““% +
<
““+ ,
int
““, /
>
““/ 0
(
““0 1
type
““1 5
:
““5 6
$str
““7 <
,
““< =
nullable
““> F
:
““F G
false
““H M
)
““M N
.
”” 

Annotation
”” #
(
””# $
$str
””$ 8
,
””8 9
$str
””: @
)
””@ A
,
””A B
UserId
‘‘ 
=
‘‘ 
table
‘‘ "
.
‘‘" #
Column
‘‘# )
<
‘‘) *
int
‘‘* -
>
‘‘- .
(
‘‘. /
type
‘‘/ 3
:
‘‘3 4
$str
‘‘5 :
,
‘‘: ;
nullable
‘‘< D
:
‘‘D E
false
‘‘F K
)
‘‘K L
,
‘‘L M
CompanyName
’’ 
=
’’  !
table
’’" '
.
’’' (
Column
’’( .
<
’’. /
string
’’/ 5
>
’’5 6
(
’’6 7
type
’’7 ;
:
’’; <
$str
’’= L
,
’’L M
nullable
’’N V
:
’’V W
false
’’X ]
)
’’] ^
,
’’^ _'
CompanyRegistrationNumber
÷÷ -
=
÷÷. /
table
÷÷0 5
.
÷÷5 6
Column
÷÷6 <
<
÷÷< =
string
÷÷= C
>
÷÷C D
(
÷÷D E
type
÷÷E I
:
÷÷I J
$str
÷÷K Z
,
÷÷Z [
nullable
÷÷\ d
:
÷÷d e
false
÷÷f k
)
÷÷k l
,
÷÷l m
	GSTNumber
◊◊ 
=
◊◊ 
table
◊◊  %
.
◊◊% &
Column
◊◊& ,
<
◊◊, -
string
◊◊- 3
>
◊◊3 4
(
◊◊4 5
type
◊◊5 9
:
◊◊9 :
$str
◊◊; J
,
◊◊J K
nullable
◊◊L T
:
◊◊T U
false
◊◊V [
)
◊◊[ \
,
◊◊\ ]
BusinessType
ÿÿ  
=
ÿÿ! "
table
ÿÿ# (
.
ÿÿ( )
Column
ÿÿ) /
<
ÿÿ/ 0
string
ÿÿ0 6
>
ÿÿ6 7
(
ÿÿ7 8
type
ÿÿ8 <
:
ÿÿ< =
$str
ÿÿ> M
,
ÿÿM N
nullable
ÿÿO W
:
ÿÿW X
false
ÿÿY ^
)
ÿÿ^ _
}
ŸŸ 
,
ŸŸ 
constraints
⁄⁄ 
:
⁄⁄ 
table
⁄⁄ "
=>
⁄⁄# %
{
€€ 
table
‹‹ 
.
‹‹ 

PrimaryKey
‹‹ $
(
‹‹$ %
$str
‹‹% 7
,
‹‹7 8
x
‹‹9 :
=>
‹‹; =
x
‹‹> ?
.
‹‹? @
SellerId
‹‹@ H
)
‹‹H I
;
‹‹I J
table
›› 
.
›› 

ForeignKey
›› $
(
››$ %
name
ﬁﬁ 
:
ﬁﬁ 
$str
ﬁﬁ =
,
ﬁﬁ= >
column
ﬂﬂ 
:
ﬂﬂ 
x
ﬂﬂ  !
=>
ﬂﬂ" $
x
ﬂﬂ% &
.
ﬂﬂ& '
UserId
ﬂﬂ' -
,
ﬂﬂ- .
principalTable
‡‡ &
:
‡‡& '
$str
‡‡( /
,
‡‡/ 0
principalColumn
·· '
:
··' (
$str
··) 1
,
··1 2
onDelete
‚‚  
:
‚‚  !
ReferentialAction
‚‚" 3
.
‚‚3 4
Cascade
‚‚4 ;
)
‚‚; <
;
‚‚< =
}
„„ 
)
„„ 
;
„„ 
migrationBuilder
ÂÂ 
.
ÂÂ 
CreateTable
ÂÂ (
(
ÂÂ( )
name
ÊÊ 
:
ÊÊ 
$str
ÊÊ  
,
ÊÊ  !
columns
ÁÁ 
:
ÁÁ 
table
ÁÁ 
=>
ÁÁ !
new
ÁÁ" %
{
ËË 
	ProductId
ÈÈ 
=
ÈÈ 
table
ÈÈ  %
.
ÈÈ% &
Column
ÈÈ& ,
<
ÈÈ, -
int
ÈÈ- 0
>
ÈÈ0 1
(
ÈÈ1 2
type
ÈÈ2 6
:
ÈÈ6 7
$str
ÈÈ8 =
,
ÈÈ= >
nullable
ÈÈ? G
:
ÈÈG H
false
ÈÈI N
)
ÈÈN O
.
ÍÍ 

Annotation
ÍÍ #
(
ÍÍ# $
$str
ÍÍ$ 8
,
ÍÍ8 9
$str
ÍÍ: @
)
ÍÍ@ A
,
ÍÍA B
SubCategoryId
ÎÎ !
=
ÎÎ" #
table
ÎÎ$ )
.
ÎÎ) *
Column
ÎÎ* 0
<
ÎÎ0 1
int
ÎÎ1 4
>
ÎÎ4 5
(
ÎÎ5 6
type
ÎÎ6 :
:
ÎÎ: ;
$str
ÎÎ< A
,
ÎÎA B
nullable
ÎÎC K
:
ÎÎK L
false
ÎÎM R
)
ÎÎR S
,
ÎÎS T
SellerId
ÏÏ 
=
ÏÏ 
table
ÏÏ $
.
ÏÏ$ %
Column
ÏÏ% +
<
ÏÏ+ ,
int
ÏÏ, /
>
ÏÏ/ 0
(
ÏÏ0 1
type
ÏÏ1 5
:
ÏÏ5 6
$str
ÏÏ7 <
,
ÏÏ< =
nullable
ÏÏ> F
:
ÏÏF G
false
ÏÏH M
)
ÏÏM N
,
ÏÏN O
BrandId
ÌÌ 
=
ÌÌ 
table
ÌÌ #
.
ÌÌ# $
Column
ÌÌ$ *
<
ÌÌ* +
int
ÌÌ+ .
>
ÌÌ. /
(
ÌÌ/ 0
type
ÌÌ0 4
:
ÌÌ4 5
$str
ÌÌ6 ;
,
ÌÌ; <
nullable
ÌÌ= E
:
ÌÌE F
false
ÌÌG L
)
ÌÌL M
,
ÌÌM N
ProductName
ÓÓ 
=
ÓÓ  !
table
ÓÓ" '
.
ÓÓ' (
Column
ÓÓ( .
<
ÓÓ. /
string
ÓÓ/ 5
>
ÓÓ5 6
(
ÓÓ6 7
type
ÓÓ7 ;
:
ÓÓ; <
$str
ÓÓ= L
,
ÓÓL M
nullable
ÓÓN V
:
ÓÓV W
false
ÓÓX ]
)
ÓÓ] ^
,
ÓÓ^ _
Description
ÔÔ 
=
ÔÔ  !
table
ÔÔ" '
.
ÔÔ' (
Column
ÔÔ( .
<
ÔÔ. /
string
ÔÔ/ 5
>
ÔÔ5 6
(
ÔÔ6 7
type
ÔÔ7 ;
:
ÔÔ; <
$str
ÔÔ= L
,
ÔÔL M
nullable
ÔÔN V
:
ÔÔV W
false
ÔÔX ]
)
ÔÔ] ^
,
ÔÔ^ _
Price
 
=
 
table
 !
.
! "
Column
" (
<
( )
decimal
) 0
>
0 1
(
1 2
type
2 6
:
6 7
$str
8 G
,
G H
nullable
I Q
:
Q R
false
S X
)
X Y
,
Y Z
StockQuantity
ÒÒ !
=
ÒÒ" #
table
ÒÒ$ )
.
ÒÒ) *
Column
ÒÒ* 0
<
ÒÒ0 1
int
ÒÒ1 4
>
ÒÒ4 5
(
ÒÒ5 6
type
ÒÒ6 :
:
ÒÒ: ;
$str
ÒÒ< A
,
ÒÒA B
nullable
ÒÒC K
:
ÒÒK L
false
ÒÒM R
)
ÒÒR S
,
ÒÒS T
ImageUrl
ÚÚ 
=
ÚÚ 
table
ÚÚ $
.
ÚÚ$ %
Column
ÚÚ% +
<
ÚÚ+ ,
string
ÚÚ, 2
>
ÚÚ2 3
(
ÚÚ3 4
type
ÚÚ4 8
:
ÚÚ8 9
$str
ÚÚ: I
,
ÚÚI J
nullable
ÚÚK S
:
ÚÚS T
false
ÚÚU Z
)
ÚÚZ [
,
ÚÚ[ \
	DateAdded
ÛÛ 
=
ÛÛ 
table
ÛÛ  %
.
ÛÛ% &
Column
ÛÛ& ,
<
ÛÛ, -
DateTime
ÛÛ- 5
>
ÛÛ5 6
(
ÛÛ6 7
type
ÛÛ7 ;
:
ÛÛ; <
$str
ÛÛ= H
,
ÛÛH I
nullable
ÛÛJ R
:
ÛÛR S
false
ÛÛT Y
)
ÛÛY Z
,
ÛÛZ [
IsActive
ÙÙ 
=
ÙÙ 
table
ÙÙ $
.
ÙÙ$ %
Column
ÙÙ% +
<
ÙÙ+ ,
bool
ÙÙ, 0
>
ÙÙ0 1
(
ÙÙ1 2
type
ÙÙ2 6
:
ÙÙ6 7
$str
ÙÙ8 =
,
ÙÙ= >
nullable
ÙÙ? G
:
ÙÙG H
false
ÙÙI N
)
ÙÙN O
}
ıı 
,
ıı 
constraints
ˆˆ 
:
ˆˆ 
table
ˆˆ "
=>
ˆˆ# %
{
˜˜ 
table
¯¯ 
.
¯¯ 

PrimaryKey
¯¯ $
(
¯¯$ %
$str
¯¯% 2
,
¯¯2 3
x
¯¯4 5
=>
¯¯6 8
x
¯¯9 :
.
¯¯: ;
	ProductId
¯¯; D
)
¯¯D E
;
¯¯E F
table
˘˘ 
.
˘˘ 

ForeignKey
˘˘ $
(
˘˘$ %
name
˙˙ 
:
˙˙ 
$str
˙˙ :
,
˙˙: ;
column
˚˚ 
:
˚˚ 
x
˚˚  !
=>
˚˚" $
x
˚˚% &
.
˚˚& '
BrandId
˚˚' .
,
˚˚. /
principalTable
¸¸ &
:
¸¸& '
$str
¸¸( 0
,
¸¸0 1
principalColumn
˝˝ '
:
˝˝' (
$str
˝˝) 2
,
˝˝2 3
onDelete
˛˛  
:
˛˛  !
ReferentialAction
˛˛" 3
.
˛˛3 4
Restrict
˛˛4 <
)
˛˛< =
;
˛˛= >
table
ˇˇ 
.
ˇˇ 

ForeignKey
ˇˇ $
(
ˇˇ$ %
name
ÄÄ 
:
ÄÄ 
$str
ÄÄ G
,
ÄÄG H
column
ÅÅ 
:
ÅÅ 
x
ÅÅ  !
=>
ÅÅ" $
x
ÅÅ% &
.
ÅÅ& '
SubCategoryId
ÅÅ' 4
,
ÅÅ4 5
principalTable
ÇÇ &
:
ÇÇ& '
$str
ÇÇ( 7
,
ÇÇ7 8
principalColumn
ÉÉ '
:
ÉÉ' (
$str
ÉÉ) 8
,
ÉÉ8 9
onDelete
ÑÑ  
:
ÑÑ  !
ReferentialAction
ÑÑ" 3
.
ÑÑ3 4
Cascade
ÑÑ4 ;
)
ÑÑ; <
;
ÑÑ< =
}
ÖÖ 
)
ÖÖ 
;
ÖÖ 
migrationBuilder
áá 
.
áá 
CreateTable
áá (
(
áá( )
name
àà 
:
àà 
$str
àà 
,
àà 
columns
ââ 
:
ââ 
table
ââ 
=>
ââ !
new
ââ" %
{
ää 
OrderId
ãã 
=
ãã 
table
ãã #
.
ãã# $
Column
ãã$ *
<
ãã* +
int
ãã+ .
>
ãã. /
(
ãã/ 0
type
ãã0 4
:
ãã4 5
$str
ãã6 ;
,
ãã; <
nullable
ãã= E
:
ããE F
false
ããG L
)
ããL M
.
åå 

Annotation
åå #
(
åå# $
$str
åå$ 8
,
åå8 9
$str
åå: @
)
åå@ A
,
ååA B
UserId
çç 
=
çç 
table
çç "
.
çç" #
Column
çç# )
<
çç) *
int
çç* -
>
çç- .
(
çç. /
type
çç/ 3
:
çç3 4
$str
çç5 :
,
çç: ;
nullable
çç< D
:
ççD E
false
ççF K
)
ççK L
,
ççL M
	OrderDate
éé 
=
éé 
table
éé  %
.
éé% &
Column
éé& ,
<
éé, -
DateTime
éé- 5
>
éé5 6
(
éé6 7
type
éé7 ;
:
éé; <
$str
éé= H
,
ééH I
nullable
ééJ R
:
ééR S
false
ééT Y
)
ééY Z
,
ééZ [
TotalAmount
èè 
=
èè  !
table
èè" '
.
èè' (
Column
èè( .
<
èè. /
decimal
èè/ 6
>
èè6 7
(
èè7 8
type
èè8 <
:
èè< =
$str
èè> M
,
èèM N
nullable
èèO W
:
èèW X
false
èèY ^
)
èè^ _
,
èè_ `
ShippingAddressId
êê %
=
êê& '
table
êê( -
.
êê- .
Column
êê. 4
<
êê4 5
int
êê5 8
>
êê8 9
(
êê9 :
type
êê: >
:
êê> ?
$str
êê@ E
,
êêE F
nullable
êêG O
:
êêO P
false
êêQ V
)
êêV W
,
êêW X
BillingAddressId
ëë $
=
ëë% &
table
ëë' ,
.
ëë, -
Column
ëë- 3
<
ëë3 4
int
ëë4 7
>
ëë7 8
(
ëë8 9
type
ëë9 =
:
ëë= >
$str
ëë? D
,
ëëD E
nullable
ëëF N
:
ëëN O
false
ëëP U
)
ëëU V
,
ëëV W
OrderStatus
íí 
=
íí  !
table
íí" '
.
íí' (
Column
íí( .
<
íí. /
int
íí/ 2
>
íí2 3
(
íí3 4
type
íí4 8
:
íí8 9
$str
íí: ?
,
íí? @
nullable
ííA I
:
ííI J
false
ííK P
)
ííP Q
}
ìì 
,
ìì 
constraints
îî 
:
îî 
table
îî "
=>
îî# %
{
ïï 
table
ññ 
.
ññ 

PrimaryKey
ññ $
(
ññ$ %
$str
ññ% 0
,
ññ0 1
x
ññ2 3
=>
ññ4 6
x
ññ7 8
.
ññ8 9
OrderId
ññ9 @
)
ññ@ A
;
ññA B
table
óó 
.
óó 

ForeignKey
óó $
(
óó$ %
name
òò 
:
òò 
$str
òò D
,
òòD E
column
ôô 
:
ôô 
x
ôô  !
=>
ôô" $
x
ôô% &
.
ôô& '
BillingAddressId
ôô' 7
,
ôô7 8
principalTable
öö &
:
öö& '
$str
öö( 3
,
öö3 4
principalColumn
õõ '
:
õõ' (
$str
õõ) 4
,
õõ4 5
onDelete
úú  
:
úú  !
ReferentialAction
úú" 3
.
úú3 4
Restrict
úú4 <
)
úú< =
;
úú= >
table
ùù 
.
ùù 

ForeignKey
ùù $
(
ùù$ %
name
ûû 
:
ûû 
$str
ûû E
,
ûûE F
column
üü 
:
üü 
x
üü  !
=>
üü" $
x
üü% &
.
üü& '
ShippingAddressId
üü' 8
,
üü8 9
principalTable
†† &
:
††& '
$str
††( 3
,
††3 4
principalColumn
°° '
:
°°' (
$str
°°) 4
,
°°4 5
onDelete
¢¢  
:
¢¢  !
ReferentialAction
¢¢" 3
.
¢¢3 4
Restrict
¢¢4 <
)
¢¢< =
;
¢¢= >
table
££ 
.
££ 

ForeignKey
££ $
(
££$ %
name
§§ 
:
§§ 
$str
§§ 6
,
§§6 7
column
•• 
:
•• 
x
••  !
=>
••" $
x
••% &
.
••& '
UserId
••' -
,
••- .
principalTable
¶¶ &
:
¶¶& '
$str
¶¶( /
,
¶¶/ 0
principalColumn
ßß '
:
ßß' (
$str
ßß) 1
,
ßß1 2
onDelete
®®  
:
®®  !
ReferentialAction
®®" 3
.
®®3 4
Cascade
®®4 ;
)
®®; <
;
®®< =
}
©© 
)
©© 
;
©© 
migrationBuilder
´´ 
.
´´ 
CreateTable
´´ (
(
´´( )
name
¨¨ 
:
¨¨ 
$str
¨¨ !
,
¨¨! "
columns
≠≠ 
:
≠≠ 
table
≠≠ 
=>
≠≠ !
new
≠≠" %
{
ÆÆ 

CartItemId
ØØ 
=
ØØ  
table
ØØ! &
.
ØØ& '
Column
ØØ' -
<
ØØ- .
int
ØØ. 1
>
ØØ1 2
(
ØØ2 3
type
ØØ3 7
:
ØØ7 8
$str
ØØ9 >
,
ØØ> ?
nullable
ØØ@ H
:
ØØH I
false
ØØJ O
)
ØØO P
.
∞∞ 

Annotation
∞∞ #
(
∞∞# $
$str
∞∞$ 8
,
∞∞8 9
$str
∞∞: @
)
∞∞@ A
,
∞∞A B
CartId
±± 
=
±± 
table
±± "
.
±±" #
Column
±±# )
<
±±) *
int
±±* -
>
±±- .
(
±±. /
type
±±/ 3
:
±±3 4
$str
±±5 :
,
±±: ;
nullable
±±< D
:
±±D E
false
±±F K
)
±±K L
,
±±L M
	ProductId
≤≤ 
=
≤≤ 
table
≤≤  %
.
≤≤% &
Column
≤≤& ,
<
≤≤, -
int
≤≤- 0
>
≤≤0 1
(
≤≤1 2
type
≤≤2 6
:
≤≤6 7
$str
≤≤8 =
,
≤≤= >
nullable
≤≤? G
:
≤≤G H
false
≤≤I N
)
≤≤N O
,
≤≤O P
Quantity
≥≥ 
=
≥≥ 
table
≥≥ $
.
≥≥$ %
Column
≥≥% +
<
≥≥+ ,
int
≥≥, /
>
≥≥/ 0
(
≥≥0 1
type
≥≥1 5
:
≥≥5 6
$str
≥≥7 <
,
≥≥< =
nullable
≥≥> F
:
≥≥F G
false
≥≥H M
)
≥≥M N
,
≥≥N O
	UnitPrice
¥¥ 
=
¥¥ 
table
¥¥  %
.
¥¥% &
Column
¥¥& ,
<
¥¥, -
decimal
¥¥- 4
>
¥¥4 5
(
¥¥5 6
type
¥¥6 :
:
¥¥: ;
$str
¥¥< K
,
¥¥K L
nullable
¥¥M U
:
¥¥U V
false
¥¥W \
)
¥¥\ ]
,
¥¥] ^

TotalPrice
µµ 
=
µµ  
table
µµ! &
.
µµ& '
Column
µµ' -
<
µµ- .
decimal
µµ. 5
>
µµ5 6
(
µµ6 7
type
µµ7 ;
:
µµ; <
$str
µµ= L
,
µµL M
nullable
µµN V
:
µµV W
false
µµX ]
)
µµ] ^
}
∂∂ 
,
∂∂ 
constraints
∑∑ 
:
∑∑ 
table
∑∑ "
=>
∑∑# %
{
∏∏ 
table
ππ 
.
ππ 

PrimaryKey
ππ $
(
ππ$ %
$str
ππ% 3
,
ππ3 4
x
ππ5 6
=>
ππ7 9
x
ππ: ;
.
ππ; <

CartItemId
ππ< F
)
ππF G
;
ππG H
table
∫∫ 
.
∫∫ 

ForeignKey
∫∫ $
(
∫∫$ %
name
ªª 
:
ªª 
$str
ªª 9
,
ªª9 :
column
ºº 
:
ºº 
x
ºº  !
=>
ºº" $
x
ºº% &
.
ºº& '
CartId
ºº' -
,
ºº- .
principalTable
ΩΩ &
:
ΩΩ& '
$str
ΩΩ( /
,
ΩΩ/ 0
principalColumn
ææ '
:
ææ' (
$str
ææ) 1
,
ææ1 2
onDelete
øø  
:
øø  !
ReferentialAction
øø" 3
.
øø3 4
Cascade
øø4 ;
)
øø; <
;
øø< =
table
¿¿ 
.
¿¿ 

ForeignKey
¿¿ $
(
¿¿$ %
name
¡¡ 
:
¡¡ 
$str
¡¡ ?
,
¡¡? @
column
¬¬ 
:
¬¬ 
x
¬¬  !
=>
¬¬" $
x
¬¬% &
.
¬¬& '
	ProductId
¬¬' 0
,
¬¬0 1
principalTable
√√ &
:
√√& '
$str
√√( 2
,
√√2 3
principalColumn
ƒƒ '
:
ƒƒ' (
$str
ƒƒ) 4
,
ƒƒ4 5
onDelete
≈≈  
:
≈≈  !
ReferentialAction
≈≈" 3
.
≈≈3 4
Cascade
≈≈4 ;
)
≈≈; <
;
≈≈< =
}
∆∆ 
)
∆∆ 
;
∆∆ 
migrationBuilder
»» 
.
»» 
CreateTable
»» (
(
»»( )
name
…… 
:
…… 
$str
…… #
,
……# $
columns
   
:
   
table
   
=>
   !
new
  " %
{
ÀÀ 
InventoryId
ÃÃ 
=
ÃÃ  !
table
ÃÃ" '
.
ÃÃ' (
Column
ÃÃ( .
<
ÃÃ. /
int
ÃÃ/ 2
>
ÃÃ2 3
(
ÃÃ3 4
type
ÃÃ4 8
:
ÃÃ8 9
$str
ÃÃ: ?
,
ÃÃ? @
nullable
ÃÃA I
:
ÃÃI J
false
ÃÃK P
)
ÃÃP Q
.
ÕÕ 

Annotation
ÕÕ #
(
ÕÕ# $
$str
ÕÕ$ 8
,
ÕÕ8 9
$str
ÕÕ: @
)
ÕÕ@ A
,
ÕÕA B
	ProductId
ŒŒ 
=
ŒŒ 
table
ŒŒ  %
.
ŒŒ% &
Column
ŒŒ& ,
<
ŒŒ, -
int
ŒŒ- 0
>
ŒŒ0 1
(
ŒŒ1 2
type
ŒŒ2 6
:
ŒŒ6 7
$str
ŒŒ8 =
,
ŒŒ= >
nullable
ŒŒ? G
:
ŒŒG H
false
ŒŒI N
)
ŒŒN O
,
ŒŒO P
QuantityInStock
œœ #
=
œœ$ %
table
œœ& +
.
œœ+ ,
Column
œœ, 2
<
œœ2 3
int
œœ3 6
>
œœ6 7
(
œœ7 8
type
œœ8 <
:
œœ< =
$str
œœ> C
,
œœC D
nullable
œœE M
:
œœM N
false
œœO T
)
œœT U
,
œœU V
ReorderLevel
––  
=
––! "
table
––# (
.
––( )
Column
––) /
<
––/ 0
int
––0 3
>
––3 4
(
––4 5
type
––5 9
:
––9 :
$str
––; @
,
––@ A
nullable
––B J
:
––J K
false
––L Q
)
––Q R
,
––R S
LastRestockedDate
—— %
=
——& '
table
——( -
.
——- .
Column
——. 4
<
——4 5
DateTime
——5 =
>
——= >
(
——> ?
type
——? C
:
——C D
$str
——E P
,
——P Q
nullable
——R Z
:
——Z [
false
——\ a
)
——a b
}
““ 
,
““ 
constraints
”” 
:
”” 
table
”” "
=>
””# %
{
‘‘ 
table
’’ 
.
’’ 

PrimaryKey
’’ $
(
’’$ %
$str
’’% 5
,
’’5 6
x
’’7 8
=>
’’9 ;
x
’’< =
.
’’= >
InventoryId
’’> I
)
’’I J
;
’’J K
table
÷÷ 
.
÷÷ 

ForeignKey
÷÷ $
(
÷÷$ %
name
◊◊ 
:
◊◊ 
$str
◊◊ A
,
◊◊A B
column
ÿÿ 
:
ÿÿ 
x
ÿÿ  !
=>
ÿÿ" $
x
ÿÿ% &
.
ÿÿ& '
	ProductId
ÿÿ' 0
,
ÿÿ0 1
principalTable
ŸŸ &
:
ŸŸ& '
$str
ŸŸ( 2
,
ŸŸ2 3
principalColumn
⁄⁄ '
:
⁄⁄' (
$str
⁄⁄) 4
,
⁄⁄4 5
onDelete
€€  
:
€€  !
ReferentialAction
€€" 3
.
€€3 4
Cascade
€€4 ;
)
€€; <
;
€€< =
}
‹‹ 
)
‹‹ 
;
‹‹ 
migrationBuilder
ﬁﬁ 
.
ﬁﬁ 
CreateTable
ﬁﬁ (
(
ﬁﬁ( )
name
ﬂﬂ 
:
ﬂﬂ 
$str
ﬂﬂ (
,
ﬂﬂ( )
columns
‡‡ 
:
‡‡ 
table
‡‡ 
=>
‡‡ !
new
‡‡" %
{
·· 
ProductDiscountId
‚‚ %
=
‚‚& '
table
‚‚( -
.
‚‚- .
Column
‚‚. 4
<
‚‚4 5
int
‚‚5 8
>
‚‚8 9
(
‚‚9 :
type
‚‚: >
:
‚‚> ?
$str
‚‚@ E
,
‚‚E F
nullable
‚‚G O
:
‚‚O P
false
‚‚Q V
)
‚‚V W
.
„„ 

Annotation
„„ #
(
„„# $
$str
„„$ 8
,
„„8 9
$str
„„: @
)
„„@ A
,
„„A B
	ProductId
‰‰ 
=
‰‰ 
table
‰‰  %
.
‰‰% &
Column
‰‰& ,
<
‰‰, -
int
‰‰- 0
>
‰‰0 1
(
‰‰1 2
type
‰‰2 6
:
‰‰6 7
$str
‰‰8 =
,
‰‰= >
nullable
‰‰? G
:
‰‰G H
false
‰‰I N
)
‰‰N O
,
‰‰O P

DiscountId
ÂÂ 
=
ÂÂ  
table
ÂÂ! &
.
ÂÂ& '
Column
ÂÂ' -
<
ÂÂ- .
int
ÂÂ. 1
>
ÂÂ1 2
(
ÂÂ2 3
type
ÂÂ3 7
:
ÂÂ7 8
$str
ÂÂ9 >
,
ÂÂ> ?
nullable
ÂÂ@ H
:
ÂÂH I
false
ÂÂJ O
)
ÂÂO P
}
ÊÊ 
,
ÊÊ 
constraints
ÁÁ 
:
ÁÁ 
table
ÁÁ "
=>
ÁÁ# %
{
ËË 
table
ÈÈ 
.
ÈÈ 

PrimaryKey
ÈÈ $
(
ÈÈ$ %
$str
ÈÈ% :
,
ÈÈ: ;
x
ÈÈ< =
=>
ÈÈ> @
x
ÈÈA B
.
ÈÈB C
ProductDiscountId
ÈÈC T
)
ÈÈT U
;
ÈÈU V
table
ÍÍ 
.
ÍÍ 

ForeignKey
ÍÍ $
(
ÍÍ$ %
name
ÎÎ 
:
ÎÎ 
$str
ÎÎ H
,
ÎÎH I
column
ÏÏ 
:
ÏÏ 
x
ÏÏ  !
=>
ÏÏ" $
x
ÏÏ% &
.
ÏÏ& '

DiscountId
ÏÏ' 1
,
ÏÏ1 2
principalTable
ÌÌ &
:
ÌÌ& '
$str
ÌÌ( 3
,
ÌÌ3 4
principalColumn
ÓÓ '
:
ÓÓ' (
$str
ÓÓ) 5
,
ÓÓ5 6
onDelete
ÔÔ  
:
ÔÔ  !
ReferentialAction
ÔÔ" 3
.
ÔÔ3 4
Cascade
ÔÔ4 ;
)
ÔÔ; <
;
ÔÔ< =
table
 
.
 

ForeignKey
 $
(
$ %
name
ÒÒ 
:
ÒÒ 
$str
ÒÒ F
,
ÒÒF G
column
ÚÚ 
:
ÚÚ 
x
ÚÚ  !
=>
ÚÚ" $
x
ÚÚ% &
.
ÚÚ& '
	ProductId
ÚÚ' 0
,
ÚÚ0 1
principalTable
ÛÛ &
:
ÛÛ& '
$str
ÛÛ( 2
,
ÛÛ2 3
principalColumn
ÙÙ '
:
ÙÙ' (
$str
ÙÙ) 4
,
ÙÙ4 5
onDelete
ıı  
:
ıı  !
ReferentialAction
ıı" 3
.
ıı3 4
Cascade
ıı4 ;
)
ıı; <
;
ıı< =
}
ˆˆ 
)
ˆˆ 
;
ˆˆ 
migrationBuilder
¯¯ 
.
¯¯ 
CreateTable
¯¯ (
(
¯¯( )
name
˘˘ 
:
˘˘ 
$str
˘˘ &
,
˘˘& '
columns
˙˙ 
:
˙˙ 
table
˙˙ 
=>
˙˙ !
new
˙˙" %
{
˚˚ 
ReviewId
¸¸ 
=
¸¸ 
table
¸¸ $
.
¸¸$ %
Column
¸¸% +
<
¸¸+ ,
int
¸¸, /
>
¸¸/ 0
(
¸¸0 1
type
¸¸1 5
:
¸¸5 6
$str
¸¸7 <
,
¸¸< =
nullable
¸¸> F
:
¸¸F G
false
¸¸H M
)
¸¸M N
.
˝˝ 

Annotation
˝˝ #
(
˝˝# $
$str
˝˝$ 8
,
˝˝8 9
$str
˝˝: @
)
˝˝@ A
,
˝˝A B
	ProductId
˛˛ 
=
˛˛ 
table
˛˛  %
.
˛˛% &
Column
˛˛& ,
<
˛˛, -
int
˛˛- 0
>
˛˛0 1
(
˛˛1 2
type
˛˛2 6
:
˛˛6 7
$str
˛˛8 =
,
˛˛= >
nullable
˛˛? G
:
˛˛G H
false
˛˛I N
)
˛˛N O
,
˛˛O P
UserId
ˇˇ 
=
ˇˇ 
table
ˇˇ "
.
ˇˇ" #
Column
ˇˇ# )
<
ˇˇ) *
int
ˇˇ* -
>
ˇˇ- .
(
ˇˇ. /
type
ˇˇ/ 3
:
ˇˇ3 4
$str
ˇˇ5 :
,
ˇˇ: ;
nullable
ˇˇ< D
:
ˇˇD E
false
ˇˇF K
)
ˇˇK L
,
ˇˇL M
Rating
ÄÄ 
=
ÄÄ 
table
ÄÄ "
.
ÄÄ" #
Column
ÄÄ# )
<
ÄÄ) *
int
ÄÄ* -
>
ÄÄ- .
(
ÄÄ. /
type
ÄÄ/ 3
:
ÄÄ3 4
$str
ÄÄ5 :
,
ÄÄ: ;
nullable
ÄÄ< D
:
ÄÄD E
false
ÄÄF K
)
ÄÄK L
,
ÄÄL M
Comment
ÅÅ 
=
ÅÅ 
table
ÅÅ #
.
ÅÅ# $
Column
ÅÅ$ *
<
ÅÅ* +
string
ÅÅ+ 1
>
ÅÅ1 2
(
ÅÅ2 3
type
ÅÅ3 7
:
ÅÅ7 8
$str
ÅÅ9 H
,
ÅÅH I
nullable
ÅÅJ R
:
ÅÅR S
false
ÅÅT Y
)
ÅÅY Z
,
ÅÅZ [

ReviewDate
ÇÇ 
=
ÇÇ  
table
ÇÇ! &
.
ÇÇ& '
Column
ÇÇ' -
<
ÇÇ- .
DateTime
ÇÇ. 6
>
ÇÇ6 7
(
ÇÇ7 8
type
ÇÇ8 <
:
ÇÇ< =
$str
ÇÇ> I
,
ÇÇI J
nullable
ÇÇK S
:
ÇÇS T
false
ÇÇU Z
)
ÇÇZ [
}
ÉÉ 
,
ÉÉ 
constraints
ÑÑ 
:
ÑÑ 
table
ÑÑ "
=>
ÑÑ# %
{
ÖÖ 
table
ÜÜ 
.
ÜÜ 

PrimaryKey
ÜÜ $
(
ÜÜ$ %
$str
ÜÜ% 8
,
ÜÜ8 9
x
ÜÜ: ;
=>
ÜÜ< >
x
ÜÜ? @
.
ÜÜ@ A
ReviewId
ÜÜA I
)
ÜÜI J
;
ÜÜJ K
table
áá 
.
áá 

ForeignKey
áá $
(
áá$ %
name
àà 
:
àà 
$str
àà D
,
ààD E
column
ââ 
:
ââ 
x
ââ  !
=>
ââ" $
x
ââ% &
.
ââ& '
	ProductId
ââ' 0
,
ââ0 1
principalTable
ää &
:
ää& '
$str
ää( 2
,
ää2 3
principalColumn
ãã '
:
ãã' (
$str
ãã) 4
,
ãã4 5
onDelete
åå  
:
åå  !
ReferentialAction
åå" 3
.
åå3 4
Cascade
åå4 ;
)
åå; <
;
åå< =
table
çç 
.
çç 

ForeignKey
çç $
(
çç$ %
name
éé 
:
éé 
$str
éé >
,
éé> ?
column
èè 
:
èè 
x
èè  !
=>
èè" $
x
èè% &
.
èè& '
UserId
èè' -
,
èè- .
principalTable
êê &
:
êê& '
$str
êê( /
,
êê/ 0
principalColumn
ëë '
:
ëë' (
$str
ëë) 1
,
ëë1 2
onDelete
íí  
:
íí  !
ReferentialAction
íí" 3
.
íí3 4
Cascade
íí4 ;
)
íí; <
;
íí< =
}
ìì 
)
ìì 
;
ìì 
migrationBuilder
ïï 
.
ïï 
CreateTable
ïï (
(
ïï( )
name
ññ 
:
ññ 
$str
ññ "
,
ññ" #
columns
óó 
:
óó 
table
óó 
=>
óó !
new
óó" %
{
òò 
OrderItemId
ôô 
=
ôô  !
table
ôô" '
.
ôô' (
Column
ôô( .
<
ôô. /
int
ôô/ 2
>
ôô2 3
(
ôô3 4
type
ôô4 8
:
ôô8 9
$str
ôô: ?
,
ôô? @
nullable
ôôA I
:
ôôI J
false
ôôK P
)
ôôP Q
.
öö 

Annotation
öö #
(
öö# $
$str
öö$ 8
,
öö8 9
$str
öö: @
)
öö@ A
,
ööA B
OrderId
õõ 
=
õõ 
table
õõ #
.
õõ# $
Column
õõ$ *
<
õõ* +
int
õõ+ .
>
õõ. /
(
õõ/ 0
type
õõ0 4
:
õõ4 5
$str
õõ6 ;
,
õõ; <
nullable
õõ= E
:
õõE F
false
õõG L
)
õõL M
,
õõM N
	ProductId
úú 
=
úú 
table
úú  %
.
úú% &
Column
úú& ,
<
úú, -
int
úú- 0
>
úú0 1
(
úú1 2
type
úú2 6
:
úú6 7
$str
úú8 =
,
úú= >
nullable
úú? G
:
úúG H
false
úúI N
)
úúN O
,
úúO P
Quantity
ùù 
=
ùù 
table
ùù $
.
ùù$ %
Column
ùù% +
<
ùù+ ,
int
ùù, /
>
ùù/ 0
(
ùù0 1
type
ùù1 5
:
ùù5 6
$str
ùù7 <
,
ùù< =
nullable
ùù> F
:
ùùF G
false
ùùH M
)
ùùM N
,
ùùN O
	UnitPrice
ûû 
=
ûû 
table
ûû  %
.
ûû% &
Column
ûû& ,
<
ûû, -
decimal
ûû- 4
>
ûû4 5
(
ûû5 6
type
ûû6 :
:
ûû: ;
$str
ûû< K
,
ûûK L
nullable
ûûM U
:
ûûU V
false
ûûW \
)
ûû\ ]
,
ûû] ^

TotalPrice
üü 
=
üü  
table
üü! &
.
üü& '
Column
üü' -
<
üü- .
decimal
üü. 5
>
üü5 6
(
üü6 7
type
üü7 ;
:
üü; <
$str
üü= L
,
üüL M
nullable
üüN V
:
üüV W
false
üüX ]
)
üü] ^
}
†† 
,
†† 
constraints
°° 
:
°° 
table
°° "
=>
°°# %
{
¢¢ 
table
££ 
.
££ 

PrimaryKey
££ $
(
££$ %
$str
££% 4
,
££4 5
x
££6 7
=>
££8 :
x
££; <
.
££< =
OrderItemId
££= H
)
££H I
;
££I J
table
§§ 
.
§§ 

ForeignKey
§§ $
(
§§$ %
name
•• 
:
•• 
$str
•• <
,
••< =
column
¶¶ 
:
¶¶ 
x
¶¶  !
=>
¶¶" $
x
¶¶% &
.
¶¶& '
OrderId
¶¶' .
,
¶¶. /
principalTable
ßß &
:
ßß& '
$str
ßß( 0
,
ßß0 1
principalColumn
®® '
:
®®' (
$str
®®) 2
,
®®2 3
onDelete
©©  
:
©©  !
ReferentialAction
©©" 3
.
©©3 4
Cascade
©©4 ;
)
©©; <
;
©©< =
table
™™ 
.
™™ 

ForeignKey
™™ $
(
™™$ %
name
´´ 
:
´´ 
$str
´´ @
,
´´@ A
column
¨¨ 
:
¨¨ 
x
¨¨  !
=>
¨¨" $
x
¨¨% &
.
¨¨& '
	ProductId
¨¨' 0
,
¨¨0 1
principalTable
≠≠ &
:
≠≠& '
$str
≠≠( 2
,
≠≠2 3
principalColumn
ÆÆ '
:
ÆÆ' (
$str
ÆÆ) 4
,
ÆÆ4 5
onDelete
ØØ  
:
ØØ  !
ReferentialAction
ØØ" 3
.
ØØ3 4
Cascade
ØØ4 ;
)
ØØ; <
;
ØØ< =
}
∞∞ 
)
∞∞ 
;
∞∞ 
migrationBuilder
≤≤ 
.
≤≤ 
CreateTable
≤≤ (
(
≤≤( )
name
≥≥ 
:
≥≥ 
$str
≥≥  
,
≥≥  !
columns
¥¥ 
:
¥¥ 
table
¥¥ 
=>
¥¥ !
new
¥¥" %
{
µµ 
	PaymentId
∂∂ 
=
∂∂ 
table
∂∂  %
.
∂∂% &
Column
∂∂& ,
<
∂∂, -
int
∂∂- 0
>
∂∂0 1
(
∂∂1 2
type
∂∂2 6
:
∂∂6 7
$str
∂∂8 =
,
∂∂= >
nullable
∂∂? G
:
∂∂G H
false
∂∂I N
)
∂∂N O
.
∑∑ 

Annotation
∑∑ #
(
∑∑# $
$str
∑∑$ 8
,
∑∑8 9
$str
∑∑: @
)
∑∑@ A
,
∑∑A B
OrderId
∏∏ 
=
∏∏ 
table
∏∏ #
.
∏∏# $
Column
∏∏$ *
<
∏∏* +
int
∏∏+ .
>
∏∏. /
(
∏∏/ 0
type
∏∏0 4
:
∏∏4 5
$str
∏∏6 ;
,
∏∏; <
nullable
∏∏= E
:
∏∏E F
false
∏∏G L
)
∏∏L M
,
∏∏M N
PaymentDate
ππ 
=
ππ  !
table
ππ" '
.
ππ' (
Column
ππ( .
<
ππ. /
DateTime
ππ/ 7
>
ππ7 8
(
ππ8 9
type
ππ9 =
:
ππ= >
$str
ππ? J
,
ππJ K
nullable
ππL T
:
ππT U
false
ππV [
)
ππ[ \
,
ππ\ ]
PaymentAmount
∫∫ !
=
∫∫" #
table
∫∫$ )
.
∫∫) *
Column
∫∫* 0
<
∫∫0 1
decimal
∫∫1 8
>
∫∫8 9
(
∫∫9 :
type
∫∫: >
:
∫∫> ?
$str
∫∫@ O
,
∫∫O P
nullable
∫∫Q Y
:
∫∫Y Z
false
∫∫[ `
)
∫∫` a
,
∫∫a b
PaymentMethod
ªª !
=
ªª" #
table
ªª$ )
.
ªª) *
Column
ªª* 0
<
ªª0 1
int
ªª1 4
>
ªª4 5
(
ªª5 6
type
ªª6 :
:
ªª: ;
$str
ªª< A
,
ªªA B
nullable
ªªC K
:
ªªK L
false
ªªM R
)
ªªR S
,
ªªS T
PaymentStatus
ºº !
=
ºº" #
table
ºº$ )
.
ºº) *
Column
ºº* 0
<
ºº0 1
int
ºº1 4
>
ºº4 5
(
ºº5 6
type
ºº6 :
:
ºº: ;
$str
ºº< A
,
ººA B
nullable
ººC K
:
ººK L
false
ººM R
)
ººR S
}
ΩΩ 
,
ΩΩ 
constraints
ææ 
:
ææ 
table
ææ "
=>
ææ# %
{
øø 
table
¿¿ 
.
¿¿ 

PrimaryKey
¿¿ $
(
¿¿$ %
$str
¿¿% 2
,
¿¿2 3
x
¿¿4 5
=>
¿¿6 8
x
¿¿9 :
.
¿¿: ;
	PaymentId
¿¿; D
)
¿¿D E
;
¿¿E F
table
¡¡ 
.
¡¡ 

ForeignKey
¡¡ $
(
¡¡$ %
name
¬¬ 
:
¬¬ 
$str
¬¬ :
,
¬¬: ;
column
√√ 
:
√√ 
x
√√  !
=>
√√" $
x
√√% &
.
√√& '
OrderId
√√' .
,
√√. /
principalTable
ƒƒ &
:
ƒƒ& '
$str
ƒƒ( 0
,
ƒƒ0 1
principalColumn
≈≈ '
:
≈≈' (
$str
≈≈) 2
,
≈≈2 3
onDelete
∆∆  
:
∆∆  !
ReferentialAction
∆∆" 3
.
∆∆3 4
Cascade
∆∆4 ;
)
∆∆; <
;
∆∆< =
}
«« 
)
«« 
;
«« 
migrationBuilder
…… 
.
…… 
CreateIndex
…… (
(
……( )
name
   
:
   
$str
   +
,
  + ,
table
ÀÀ 
:
ÀÀ 
$str
ÀÀ "
,
ÀÀ" #
column
ÃÃ 
:
ÃÃ 
$str
ÃÃ  
,
ÃÃ  !
unique
ÕÕ 
:
ÕÕ 
true
ÕÕ 
)
ÕÕ 
;
ÕÕ 
migrationBuilder
œœ 
.
œœ 
CreateIndex
œœ (
(
œœ( )
name
–– 
:
–– 
$str
–– +
,
––+ ,
table
—— 
:
—— 
$str
—— "
,
——" #
column
““ 
:
““ 
$str
““  
)
““  !
;
““! "
migrationBuilder
‘‘ 
.
‘‘ 
CreateIndex
‘‘ (
(
‘‘( )
name
’’ 
:
’’ 
$str
’’ .
,
’’. /
table
÷÷ 
:
÷÷ 
$str
÷÷ "
,
÷÷" #
column
◊◊ 
:
◊◊ 
$str
◊◊ #
)
◊◊# $
;
◊◊$ %
migrationBuilder
ŸŸ 
.
ŸŸ 
CreateIndex
ŸŸ (
(
ŸŸ( )
name
⁄⁄ 
:
⁄⁄ 
$str
⁄⁄ '
,
⁄⁄' (
table
€€ 
:
€€ 
$str
€€ 
,
€€ 
column
‹‹ 
:
‹‹ 
$str
‹‹  
)
‹‹  !
;
‹‹! "
migrationBuilder
ﬁﬁ 
.
ﬁﬁ 
CreateIndex
ﬁﬁ (
(
ﬁﬁ( )
name
ﬂﬂ 
:
ﬂﬂ 
$str
ﬂﬂ 0
,
ﬂﬂ0 1
table
‡‡ 
:
‡‡ 
$str
‡‡ $
,
‡‡$ %
column
·· 
:
·· 
$str
·· #
,
··# $
unique
‚‚ 
:
‚‚ 
true
‚‚ 
)
‚‚ 
;
‚‚ 
migrationBuilder
‰‰ 
.
‰‰ 
CreateIndex
‰‰ (
(
‰‰( )
name
ÂÂ 
:
ÂÂ 
$str
ÂÂ -
,
ÂÂ- .
table
ÊÊ 
:
ÊÊ 
$str
ÊÊ #
,
ÊÊ# $
column
ÁÁ 
:
ÁÁ 
$str
ÁÁ !
)
ÁÁ! "
;
ÁÁ" #
migrationBuilder
ÈÈ 
.
ÈÈ 
CreateIndex
ÈÈ (
(
ÈÈ( )
name
ÍÍ 
:
ÍÍ 
$str
ÍÍ /
,
ÍÍ/ 0
table
ÎÎ 
:
ÎÎ 
$str
ÎÎ #
,
ÎÎ# $
column
ÏÏ 
:
ÏÏ 
$str
ÏÏ #
)
ÏÏ# $
;
ÏÏ$ %
migrationBuilder
ÓÓ 
.
ÓÓ 
CreateIndex
ÓÓ (
(
ÓÓ( )
name
ÔÔ 
:
ÔÔ 
$str
ÔÔ 2
,
ÔÔ2 3
table
 
:
 
$str
 
,
  
column
ÒÒ 
:
ÒÒ 
$str
ÒÒ *
)
ÒÒ* +
;
ÒÒ+ ,
migrationBuilder
ÛÛ 
.
ÛÛ 
CreateIndex
ÛÛ (
(
ÛÛ( )
name
ÙÙ 
:
ÙÙ 
$str
ÙÙ 3
,
ÙÙ3 4
table
ıı 
:
ıı 
$str
ıı 
,
ıı  
column
ˆˆ 
:
ˆˆ 
$str
ˆˆ +
)
ˆˆ+ ,
;
ˆˆ, -
migrationBuilder
¯¯ 
.
¯¯ 
CreateIndex
¯¯ (
(
¯¯( )
name
˘˘ 
:
˘˘ 
$str
˘˘ (
,
˘˘( )
table
˙˙ 
:
˙˙ 
$str
˙˙ 
,
˙˙  
column
˚˚ 
:
˚˚ 
$str
˚˚  
)
˚˚  !
;
˚˚! "
migrationBuilder
˝˝ 
.
˝˝ 
CreateIndex
˝˝ (
(
˝˝( )
name
˛˛ 
:
˛˛ 
$str
˛˛ +
,
˛˛+ ,
table
ˇˇ 
:
ˇˇ 
$str
ˇˇ !
,
ˇˇ! "
column
ÄÄ 
:
ÄÄ 
$str
ÄÄ !
)
ÄÄ! "
;
ÄÄ" #
migrationBuilder
ÇÇ 
.
ÇÇ 
CreateIndex
ÇÇ (
(
ÇÇ( )
name
ÉÉ 
:
ÉÉ 
$str
ÉÉ 1
,
ÉÉ1 2
table
ÑÑ 
:
ÑÑ 
$str
ÑÑ (
,
ÑÑ( )
column
ÖÖ 
:
ÖÖ 
$str
ÖÖ  
,
ÖÖ  !
unique
ÜÜ 
:
ÜÜ 
true
ÜÜ 
)
ÜÜ 
;
ÜÜ 
migrationBuilder
àà 
.
àà 
CreateIndex
àà (
(
àà( )
name
ââ 
:
ââ 
$str
ââ 6
,
ââ6 7
table
ää 
:
ää 
$str
ää )
,
ää) *
column
ãã 
:
ãã 
$str
ãã $
)
ãã$ %
;
ãã% &
migrationBuilder
çç 
.
çç 
CreateIndex
çç (
(
çç( )
name
éé 
:
éé 
$str
éé 5
,
éé5 6
table
èè 
:
èè 
$str
èè )
,
èè) *
column
êê 
:
êê 
$str
êê #
)
êê# $
;
êê$ %
migrationBuilder
íí 
.
íí 
CreateIndex
íí (
(
íí( )
name
ìì 
:
ìì 
$str
ìì 3
,
ìì3 4
table
îî 
:
îî 
$str
îî '
,
îî' (
column
ïï 
:
ïï 
$str
ïï #
)
ïï# $
;
ïï$ %
migrationBuilder
óó 
.
óó 
CreateIndex
óó (
(
óó( )
name
òò 
:
òò 
$str
òò 0
,
òò0 1
table
ôô 
:
ôô 
$str
ôô '
,
ôô' (
column
öö 
:
öö 
$str
öö  
)
öö  !
;
öö! "
migrationBuilder
úú 
.
úú 
CreateIndex
úú (
(
úú( )
name
ùù 
:
ùù 
$str
ùù +
,
ùù+ ,
table
ûû 
:
ûû 
$str
ûû !
,
ûû! "
column
üü 
:
üü 
$str
üü !
)
üü! "
;
üü" #
migrationBuilder
°° 
.
°° 
CreateIndex
°° (
(
°°( )
name
¢¢ 
:
¢¢ 
$str
¢¢ 1
,
¢¢1 2
table
££ 
:
££ 
$str
££ !
,
££! "
column
§§ 
:
§§ 
$str
§§ '
)
§§' (
;
§§( )
migrationBuilder
¶¶ 
.
¶¶ 
CreateIndex
¶¶ (
(
¶¶( )
name
ßß 
:
ßß 
$str
ßß /
,
ßß/ 0
table
®® 
:
®® 
$str
®® &
,
®®& '
column
©© 
:
©© 
$str
©©  
,
©©  !
unique
™™ 
:
™™ 
true
™™ 
)
™™ 
;
™™ 
migrationBuilder
¨¨ 
.
¨¨ 
CreateIndex
¨¨ (
(
¨¨( )
name
≠≠ 
:
≠≠ 
$str
≠≠ 9
,
≠≠9 :
table
ÆÆ 
:
ÆÆ 
$str
ÆÆ &
,
ÆÆ& '
column
ØØ 
:
ØØ 
$str
ØØ *
)
ØØ* +
;
ØØ+ ,
}
∞∞ 	
	protected
≥≥ 
override
≥≥ 
void
≥≥ 
Down
≥≥  $
(
≥≥$ %
MigrationBuilder
≥≥% 5
migrationBuilder
≥≥6 F
)
≥≥F G
{
¥¥ 	
migrationBuilder
µµ 
.
µµ 
	DropTable
µµ &
(
µµ& '
name
∂∂ 
:
∂∂ 
$str
∂∂ !
)
∂∂! "
;
∂∂" #
migrationBuilder
∏∏ 
.
∏∏ 
	DropTable
∏∏ &
(
∏∏& '
name
ππ 
:
ππ 
$str
ππ !
)
ππ! "
;
ππ" #
migrationBuilder
ªª 
.
ªª 
	DropTable
ªª &
(
ªª& '
name
ºº 
:
ºº 
$str
ºº !
)
ºº! "
;
ºº" #
migrationBuilder
ææ 
.
ææ 
	DropTable
ææ &
(
ææ& '
name
øø 
:
øø 
$str
øø #
)
øø# $
;
øø$ %
migrationBuilder
¡¡ 
.
¡¡ 
	DropTable
¡¡ &
(
¡¡& '
name
¬¬ 
:
¬¬ 
$str
¬¬ "
)
¬¬" #
;
¬¬# $
migrationBuilder
ƒƒ 
.
ƒƒ 
	DropTable
ƒƒ &
(
ƒƒ& '
name
≈≈ 
:
≈≈ 
$str
≈≈  
)
≈≈  !
;
≈≈! "
migrationBuilder
«« 
.
«« 
	DropTable
«« &
(
««& '
name
»» 
:
»» 
$str
»» '
)
»»' (
;
»»( )
migrationBuilder
   
.
   
	DropTable
   &
(
  & '
name
ÀÀ 
:
ÀÀ 
$str
ÀÀ (
)
ÀÀ( )
;
ÀÀ) *
migrationBuilder
ÕÕ 
.
ÕÕ 
	DropTable
ÕÕ &
(
ÕÕ& '
name
ŒŒ 
:
ŒŒ 
$str
ŒŒ &
)
ŒŒ& '
;
ŒŒ' (
migrationBuilder
–– 
.
–– 
	DropTable
–– &
(
––& '
name
—— 
:
—— 
$str
—— %
)
——% &
;
——& '
migrationBuilder
”” 
.
”” 
	DropTable
”” &
(
””& '
name
‘‘ 
:
‘‘ 
$str
‘‘ 
)
‘‘ 
;
‘‘ 
migrationBuilder
÷÷ 
.
÷÷ 
	DropTable
÷÷ &
(
÷÷& '
name
◊◊ 
:
◊◊ 
$str
◊◊ 
)
◊◊ 
;
◊◊  
migrationBuilder
ŸŸ 
.
ŸŸ 
	DropTable
ŸŸ &
(
ŸŸ& '
name
⁄⁄ 
:
⁄⁄ 
$str
⁄⁄ !
)
⁄⁄! "
;
⁄⁄" #
migrationBuilder
‹‹ 
.
‹‹ 
	DropTable
‹‹ &
(
‹‹& '
name
›› 
:
›› 
$str
››  
)
››  !
;
››! "
migrationBuilder
ﬂﬂ 
.
ﬂﬂ 
	DropTable
ﬂﬂ &
(
ﬂﬂ& '
name
‡‡ 
:
‡‡ 
$str
‡‡ !
)
‡‡! "
;
‡‡" #
migrationBuilder
‚‚ 
.
‚‚ 
	DropTable
‚‚ &
(
‚‚& '
name
„„ 
:
„„ 
$str
„„ 
)
„„ 
;
„„  
migrationBuilder
ÂÂ 
.
ÂÂ 
	DropTable
ÂÂ &
(
ÂÂ& '
name
ÊÊ 
:
ÊÊ 
$str
ÊÊ %
)
ÊÊ% &
;
ÊÊ& '
migrationBuilder
ËË 
.
ËË 
	DropTable
ËË &
(
ËË& '
name
ÈÈ 
:
ÈÈ 
$str
ÈÈ 
)
ÈÈ 
;
ÈÈ 
migrationBuilder
ÎÎ 
.
ÎÎ 
	DropTable
ÎÎ &
(
ÎÎ& '
name
ÏÏ 
:
ÏÏ 
$str
ÏÏ (
)
ÏÏ( )
;
ÏÏ) *
}
ÌÌ 	
}
ÓÓ 
}ÔÔ «
\D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\JWT\TokenGeneration.cs
	namespace 	
EcomLib
 
. 
JWT 
{ 
public 

class 
TokenGeneration  
{ 
public 
string 
GenerateJWT !
(! "
User" &
validatedUser' 4
)4 5
{ 	
var 
key 
= 
$str ]
;] ^
var 

securedKey 
= 
new   
SymmetricSecurityKey! 5
(5 6
Encoding6 >
.> ?
UTF8? C
.C D
GetBytesD L
(L M
keyM P
)P Q
)Q R
;R S
var 
securityCredentials #
=$ %
new& )
SigningCredentials* <
(< =

securedKey= G
,G H
SecurityAlgorithmsI [
.[ \

HmacSha256\ f
)f g
;g h
var 
claims 
= 
new 
List !
<! "
Claim" '
>' (
(( )
)) *
{ 
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2

UniqueName2 <
,< =
validatedUser= J
.J K
UsernameK S
)S T
,T U
new 
Claim 
( 
$str "
," #
validatedUser$ 1
.1 2
UserId2 8
.8 9
ToString9 A
(A B
)B C
)C D
,D E
new 
Claim 
( 

ClaimTypes $
.$ %
Role% )
,) *
validatedUser* 7
.7 8
Role8 <
.< =
ToString= E
(E F
)F G
)G H
} 
; 
var!! 
token!! 
=!! 
new!! 
JwtSecurityToken!! ,
(!!, -
issuer## 
:## 
$str## %
,##% &
audience$$ 
:$$ 
$str$$ )
,$$) *
claims%% 
:%% 
claims%%  
,%%  !
expires&& 
:&& 
DateTime&& #
.&&# $
Now&&$ '
.&&' (
AddHours&&( 0
(&&0 1
$num&&1 2
)&&2 3
,&&3 4
signingCredentials'' $
:''$ %
securityCredentials''& 9
)(( 
;(( 
return)) 
new)) #
JwtSecurityTokenHandler)) .
()). /
)))/ 0
.))0 1

WriteToken))1 ;
()); <
token))< A
)))A B
;))B C
}** 	
}++ 
},, È6
kD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Exceptionhandling\CustomExceptions.cs
	namespace 	
EcomLib
 
. 
Exceptionhandling #
{ 
public		 

class		 )
CannotRetrieveRecordException		 .
:		/ 0
	Exception		1 :
{

 
public )
CannotRetrieveRecordException ,
(, -
string- 3
message4 ;
); <
:= >
base? C
(C D
messageD K
)K L
{M N
}O P
} 
public 

class !
InvalidInputException &
:' (
	Exception) 2
{ 
public !
InvalidInputException $
($ %
string% +
message, 3
)3 4
:5 6
base7 ;
(; <
message< C
)C D
{E F
}G H
} 
public 

class !
UserNotFoundException &
:' (
	Exception) 2
{ 
public !
UserNotFoundException $
($ %
string% +
message, 3
)3 4
:5 6
base7 ;
(; <
message< C
)C D
{E F
}G H
} 
public 

class $
ProductNotFoundException )
:* +
	Exception, 5
{ 
public $
ProductNotFoundException '
(' (
string( .
message/ 6
)6 7
:8 9
base: >
(> ?
message? F
)F G
{H I
}J K
} 
public 

class &
ItemAlreadyExistsException +
:, -
	Exception. 7
{ 
public &
ItemAlreadyExistsException )
() *
string* 0
message1 8
)8 9
:: ;
base< @
(@ A
messageA H
)H I
{J K
}L M
} 
public 

class %
CategoryNotFoundException *
:+ ,
	Exception- 6
{ 
public   %
CategoryNotFoundException   (
(  ( )
string  ) /
message  0 7
)  7 8
:  9 :
base  ; ?
(  ? @
message  @ G
)  G H
{  I J
}  K L
}!! 
public"" 

class"" "
BrandNotFoundException"" '
:""( )
	Exception""* 3
{## 
public$$ "
BrandNotFoundException$$ %
($$% &
string$$& ,
message$$- 4
)$$4 5
:$$6 7
base$$8 <
($$< =
message$$= D
)$$D E
{$$F G
}$$H I
}%% 
public'' 

class'' &
InventoryNotFoundException'' +
:'', -
	Exception''. 7
{(( 
public)) &
InventoryNotFoundException)) )
())) *
string))* 0
message))1 8
)))8 9
:)): ;
base))< @
())@ A
message))A H
)))H I
{))J K
}))L M
}** 
public++ 

class++ !
CartNotFoundException++ &
:++' (
	Exception++) 2
{,, 
public-- !
CartNotFoundException-- $
(--$ %
string--% +
message--, 3
)--3 4
:--5 6
base--7 ;
(--; <
message--< C
)--C D
{--E F
}--G H
}.. 
public00 

class00 %
CartItemNotFoundException00 *
:00+ ,
	Exception00- 6
{11 
public22 %
CartItemNotFoundException22 (
(22( )
string22) /
message220 7
)227 8
:229 :
base22; ?
(22? @
message22@ G
)22G H
{22I J
}22K L
}33 
public55 

class55 "
CartOperationException55 '
:55( )
	Exception55* 3
{66 
public77 "
CartOperationException77 %
(77% &
string77& ,
message77- 4
)774 5
:776 7
base778 <
(77< =
message77= D
)77D E
{77F G
}77H I
}88 
public99 

class99 %
DiscountNotFoundException99 *
:99+ ,
	Exception99- 6
{:: 
public;; %
DiscountNotFoundException;; (
(;;( )
string;;) /
message;;0 7
);;7 8
:;;9 :
base;;; ?
(;;? @
message;;@ G
);;G H
{;;I J
};;K L
}<< 
public== 

class== ,
 ProductDiscountNotFoundException== 1
:==2 3
	Exception==4 =
{>> 
public?? ,
 ProductDiscountNotFoundException?? /
(??/ 0
string??0 6
message??7 >
)??> ?
:??@ A
base??B F
(??F G
message??G N
)??N O
{??P Q
}??R S
}@@ 
publicAA 

classAA #
ReviewNotFoundExceptionAA (
:AA) *
	ExceptionAA+ 4
{BB 
publicCC #
ReviewNotFoundExceptionCC &
(CC& '
stringCC' -
messageCC. 5
)CC5 6
:CC7 8
baseCC9 =
(CC= >
messageCC> E
)CCE F
{CCG H
}CCI J
}DD 
publicEE 

classEE 
DataAccessExceptionEE $
:EE% &
	ExceptionEE' 0
{FF 
publicGG 
DataAccessExceptionGG "
(GG" #
stringGG# )
messageGG* 1
)GG1 2
:GG3 4
baseGG5 9
(GG9 :
messageGG: A
)GGA B
{GGC D
}GGE F
}HH 
publicJJ 

classJJ "
OrderNotFoundExceptionJJ '
:JJ( )
	ExceptionJJ* 3
{KK 
publicLL "
OrderNotFoundExceptionLL %
(LL% &
intLL& )
orderIdLL* 1
)LL1 2
:MM 
baseMM 
(MM 
$"MM 
$strMM #
{MM# $
orderIdMM$ +
}MM+ ,
$strMM, 7
"MM7 8
)MM8 9
{NN 	
}OO 	
}PP 
publicSS 

classSS &
OrderItemNotFoundExceptionSS +
:SS, -
	ExceptionSS. 7
{TT 
publicUU &
OrderItemNotFoundExceptionUU )
(UU) *
intUU* -
orderItemIdUU. 9
)UU9 :
:VV 
baseVV 
(VV 
$"VV 
$strVV (
{VV( )
orderItemIdVV) 4
}VV4 5
$strVV5 @
"VV@ A
)VVA B
{WW 	
}XX 	
}YY 
}[[ »
eD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\UserDtos\UserProfileDto.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
UserDtos 
{ 
public		 

class		 
UserProfileDto		 
{

 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
PersonalDetailsDto !
PersonalDetails" 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 

AddressDto 
Address !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
public 

class 
PersonalDetailsDto #
{ 
public 
int 
PersonalDetailsId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
DateOfBirth #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
public!! 

class!! 

AddressDto!! 
{"" 
public## 
int## 
	AddressId## 
{## 
get## "
;##" #
set##$ '
;##' (
}##) *
public$$ 
string$$ 
AddressLine1$$ "
{$$# $
get$$% (
;$$( )
set$$* -
;$$- .
}$$/ 0
public%% 
string%% 
AddressLine2%% "
{%%# $
get%%% (
;%%( )
set%%* -
;%%- .
}%%/ 0
public&& 
string&& 
City&& 
{&& 
get&&  
;&&  !
set&&" %
;&&% &
}&&' (
public'' 
string'' 
State'' 
{'' 
get'' !
;''! "
set''# &
;''& '
}''( )
public(( 
string(( 

PostalCode((  
{((! "
get((# &
;((& '
set((( +
;((+ ,
}((- .
public)) 
string)) 
Country)) 
{)) 
get))  #
;))# $
set))% (
;))( )
}))* +
}** 
},, ì
^D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\UserDtos\UserDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
UserDtos 
{ 
public		 

class		 
UserDTO		 
{

 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} Å

`D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\UserDtos\SellerDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
UserDtos 
{ 
public		 

class		 
	SellerDTO		 
{

 
public 
int 
SellerId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
CompanyName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string %
CompanyRegistrationNumber /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
string 
	GSTNumber 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
BusinessType "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ∫
gD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\UserDtos\SellerDetailsDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
{ 
public		 

class		 
SellerDetailsDTO		 !
{

 
public 
string 
CompanyName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string %
CompanyRegistrationNumber /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
string 
	GSTNumber 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
BusinessType "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} Û
fD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\UserDtos\RegisterUserDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
UserDtos 
{ 
public		 

class		 
RegisterUserDTO		  
{

 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
PersonalDetailsDTO !
PersonalDetails" 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 

AddressDTO 
Address !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} Ø
hD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\UserDtos\RegisterSellerDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
UserDtos 
{ 
public		 

class		 
RegisterSellerDTO		 "
:		# $
RegisterUserDTO		% 4
{

 
public 
SellerDetailsDTO 
SellerDetails  -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
} 
} »
iD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\UserDtos\PersonalDetailsDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
{ 
public		 

class		 
PersonalDetailsDTO		 #
{

 
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
DateOfBirth #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ¢
hD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\UserDtos\LastRegisteredDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
UserDtos 
{ 
public		 

class		 
LastRegisteredDTO		 "
{

 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
} 
public 

class #
LastRegisteredSellerDTO (
{ 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
SellerId 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
CompanyName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string %
CompanyRegistrationNumber /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
string 
	GSTNumber 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
BusinessType "
{# $
get% (
;( )
set* -
;- .
}/ 0
}   
}"" ≈
aD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\UserDtos\GetUserDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
UserDtos 
{		 
public

 

class

 

GetUserDTO

 
{ 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
? 
FullName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
? 
Gender 
{ 
get  #
;# $
set% (
;( )
}* +
public 
DateTime 
? 
DateOfBirth $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
? 
PhoneNumber "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
? 
Address 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} î
dD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\UserDtos\GetAddressDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
UserDtos 
{ 
public		 

class		 
GetAddressDTO		 
{

 
public 
int 
	AddressId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
AddressLine1 "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
AddressLine2 "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 

PostalCode  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Country 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} œ	
aD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\UserDtos\AddressDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
{ 
public		 

class		 

AddressDTO		 
{

 
public 
string 
AddressLine1 "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
AddressLine2 "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 

PostalCode  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Country 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ∏
WD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\ReviewDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
{ 
public		 

class		 
	ReviewDTO		 
{

 
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
Rating 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Comment 
{ 
get  #
;# $
set% (
;( )
}* +
} 
public 

class 
ReviewResponseDTO "
{ 
public 
int 
ReviewId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
ProductName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
Rating 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Comment 
{ 
get  #
;# $
set% (
;( )
}* +
public 
DateTime 

ReviewDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} «
jD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\ProductDtos\SellerProductDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
ProductDtos "
{ 
public		 

class		 
SellerProductDTO		 !
{

 
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
SellerId 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
StockQuantity  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
ImageUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
SubCategoryId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
BrandId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	BrandName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
RestockLevel 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
LastRestocked %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ∑
nD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\ProductDtos\ProductWithSellerDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
ProductDtos "
{ 
public		 

class		  
ProductWithSellerDTO		 %
{

 
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ProductName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
StockQuantity  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
ImageUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
	DateAdded !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
BrandId 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
SubCategoryId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
SellerId 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
CompanyName !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} â
qD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\ProductDtos\ProductWithInventoryDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
ProductDtos "
{ 
public		 

class		 #
ProductWithInventoryDTO		 (
{

 
public 

ProductDTO 
Product !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} Ñ
dD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\ProductDtos\ProductDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
ProductDtos "
{ 
public		 

class		 

ProductDTO		 
{

 
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ProductName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
SellerId 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
StockQuantity  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
ImageUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
	DateAdded !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
BrandId 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
SubCategoryId  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} –
kD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\ProductDtos\ProductDetailsDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
ProductDtos "
{ 
public		 

class		 
ProductDetailsDTO		 "
{

 
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ProductName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
	BrandName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
ImageUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
StockQuantity  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
RestockLevel 
{  !
get" %
;% &
set' *
;* +
}, -
public 
bool 

IsLowStock 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
List 
< 
ProductReviewDTO $
>$ %
Reviews& -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
} 
public 

class 
ProductReviewDTO !
{ 
public 
int 
ReviewId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
Rating 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Comment 
{ 
get  #
;# $
set% (
;( )
}* +
public 
DateTime 

ReviewDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
public!! 

class!! 
WishlistProductDTO!! #
{"" 
public## 
int## 
	ProductId## 
{## 
get## "
;##" #
set##$ '
;##' (
}##) *
public$$ 
string$$ 
ProductName$$ !
{$$" #
get$$$ '
;$$' (
set$$) ,
;$$, -
}$$. /
public%% 
DateTime%% 
WishlistAddedDate%% )
{%%* +
get%%, /
;%%/ 0
set%%1 4
;%%4 5
}%%6 7
public&& 
string&& 
ImageUrl&& 
{&&  
get&&! $
;&&$ %
set&&& )
;&&) *
}&&+ ,
public'' 
decimal'' 
Price'' 
{'' 
get'' "
;''" #
set''$ '
;''' (
}'') *
public(( 
string(( 
Description(( !
{((" #
get(($ '
;((' (
set(() ,
;((, -
}((. /
})) 
}-- Ó
fD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\ProductDtos\InventoryDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
ProductDtos "
{ 
public		 

class		 
InventoryDTO		 
{

 
public 
int 
InventoryId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
QuantityInStock "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
ReorderLevel 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
LastRestockedDate )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} ô
fD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\OrderDtos\PlacedOrderDTO.cs
	namespace		 	
EcomLib		
 
.		 
Dtos		 
.		 
	OrderDtos		  
{

 
public 

class !
PlaceOrderResponseDto &
{ 
public 
int 
OrderId 
{ 
get  
;  !
set" %
;% &
}' (
public 
decimal 
TotalAmount "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
	OrderDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
OrderStatus 
OrderStatus &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
List 
<  
OrderItemResponseDto (
>( )

OrderItems* 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
List 
< 
PaymentResponseDto &
>& '
Payments( 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
} 
public 

class  
OrderItemResponseDto %
{ 
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
SellerId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
Quantity 
{ 
get !
;! "
set# &
;& '
}( )
public 
decimal 
	UnitPrice  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
decimal 

TotalPrice !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
OrderItemStatus 

ItemStatus )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
public 

class 
PaymentResponseDto #
{   
public!! 
DateTime!! 
PaymentDate!! #
{!!$ %
get!!& )
;!!) *
set!!+ .
;!!. /
}!!0 1
public"" 
decimal"" 
PaymentAmount"" $
{""% &
get""' *
;""* +
set"", /
;""/ 0
}""1 2
public## 
PaymentMethod## 
PaymentMethod## *
{##+ ,
get##- 0
;##0 1
set##2 5
;##5 6
}##7 8
public$$ 
PaymentStatus$$ 
PaymentStatus$$ *
{$$+ ,
get$$- 0
;$$0 1
set$$2 5
;$$5 6
}$$7 8
}%% 
}'' ≠
`D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\OrderDtos\OrderDTO.cs
	namespace		 	
EcomLib		
 
.		 
Dtos		 
.		 
	OrderDtos		  
{

 
public 

class 
PlaceOrderDto 
{ 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
DateTime 
	OrderDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
TotalAmount "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
ShippingAddressId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
BillingAddressId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
OrderStatus 
OrderStatus &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
List 
< 
OrderItemDto  
>  !

OrderItems" ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
List 
< 

PaymentDto 
> 
Payments  (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
public 

class 

PaymentDto 
{ 
public 
DateTime 
PaymentDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
decimal 
PaymentAmount $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
PaymentMethod 
PaymentMethod *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
PaymentStatus 
PaymentStatus *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
public 

class 
OrderItemDto 
{   
public!! 
int!! 
	ProductId!! 
{!! 
get!! "
;!!" #
set!!$ '
;!!' (
}!!) *
public"" 
int"" 
SellerId"" 
{"" 
get"" !
;""! "
set""# &
;""& '
}""( )
public## 
int## 
Quantity## 
{## 
get## !
;##! "
set### &
;##& '
}##( )
public$$ 
decimal$$ 
	UnitPrice$$  
{$$! "
get$$# &
;$$& '
set$$( +
;$$+ ,
}$$- .
public%% 
decimal%% 

TotalPrice%% !
{%%" #
get%%$ '
;%%' (
set%%) ,
;%%, -
}%%. /
public&& 
OrderItemStatus&& 

ItemStatus&& )
{&&* +
get&&, /
;&&/ 0
set&&1 4
;&&4 5
}&&6 7
}'' 
}** Í
cD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\OrderDtos\GetOrderDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
	OrderDtos  
{		 
public

 

class

 
AdminOrderDTO

 
{ 
public 
int 
OrderId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
	OrderDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
TotalAmount "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
OrderStatus 
OrderStatus &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
public 

class 
SellerOrderItemDTO #
{ 
public 
int 
OrderItemId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
ProductName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
Quantity 
{ 
get !
;! "
set# &
;& '
}( )
public 
decimal 
	UnitPrice  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
decimal 

TotalPrice !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
OrderItemStatus 

ItemStatus )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
public 

class 
OrderItemuserDTO !
{ 
public 
int 
OrderItemId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public   
string   
ProductName   !
{  " #
get  $ '
;  ' (
set  ) ,
;  , -
}  . /
public!! 
int!! 
Quantity!! 
{!! 
get!! !
;!!! "
set!!# &
;!!& '
}!!( )
public"" 
decimal"" 
	UnitPrice""  
{""! "
get""# &
;""& '
set""( +
;""+ ,
}""- .
public## 
decimal## 

TotalPrice## !
{##" #
get##$ '
;##' (
set##) ,
;##, -
}##. /
public$$ 
string$$ 

ItemStatus$$  
{$$! "
get$$# &
;$$& '
set$$( +
;$$+ ,
}$$- .
public%% 
string%% 
UserName%% 
{%%  
get%%! $
;%%$ %
set%%& )
;%%) *
}%%+ ,
public&& 
string&& 
ImageUrl&& 
{&&  
get&&! $
;&&$ %
set&&& )
;&&) *
}&&+ ,
}'' 
}** π
mD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\DiscountDtos\ProductDiscountDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
DiscountDtos #
{ 
public		 

class		 
ProductDiscountDTO		 #
{

 
public 
int 
ProductDiscountId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 

DiscountId 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} Ã
fD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\DiscountDtos\DiscountDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
DiscountDtos #
{		 
public

 

class

 
DiscountDTO

 
{ 
public 
int 

DiscountId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
DiscountCode "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DiscountType 
DiscountType (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
decimal 
DiscountValue $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
DateTime 
	StartDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
EndDate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ç
gD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\CategoryDtos\CategoryDtos.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
CategoryDtos #
{ 
public		 

class		 
ParentCategoryDTO		 "
{

 
public 
int 
ParentCategoryId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
CategoryName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
public 

class 
SubCategoryDTO 
{ 
public 
int 
SubCategoryId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
ParentCategoryId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
ParentcategoryName (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
SubCategoryName %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
public 

class 
BrandDTO 
{ 
public 
int 
BrandId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	BrandName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
LogoUrl 
{ 
get  #
;# $
set% (
;( )
}* +
} 
}!! ¿
_D:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\CartDtos\CartDtos.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
CartDtos 
{ 
public		 

class		 
CartItemDTO		 
{

 
public 
int 

CartItemId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ProductName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
ImageUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
Quantity 
{ 
get !
;! "
set# &
;& '
}( )
public 
decimal 

TotalPrice !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
public 

class 
CartDTO 
{ 
public 
int 
CartId 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
decimal 
TotalAmount "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
DateCreated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
List 
< 
CartItemDTO 
>  
	CartItems! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} Ü
mD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\AnalyticsDtos\UserAnalyticsDtos.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
AnalyticsDtos $
{ 
public		 

class		 
TopActiveUserDto		 !
{

 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
PurchaseCount  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
public 

class 
UserActivityLogDto #
{ 
public 
string 
Activity 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Date 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Details 
{ 
get  #
;# $
set% (
;( )
}* +
} 
public 

class !
TotalRegistrationsDto &
{ 
public 
int 

TotalUsers 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
TotalSellers 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ±
nD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\AnalyticsDtos\SellerAnaliticsDTO.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
AnalyticsDtos $
{ 
public		 

class		 
SalesByProductDTO		 "
{

 
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ProductName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
TotalQuantitySold $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
decimal 
TotalSalesAmount '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
public 

class 
SalesByMonthDto  
{ 
public 
int 
Month 
{ 
get 
; 
set  #
;# $
}% &
public 
int 
Year 
{ 
get 
; 
set "
;" #
}$ %
public 
int 
TotalOrders 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
decimal 
TotalSalesAmount '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
public 

class  
TopSellingProductDto %
{ 
public 
int 
SellerId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
	ProductId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ProductName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
TotalQuantitySold $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
decimal 
TotalSalesAmount '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
}!! ˛
nD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Dtos\AnalyticsDtos\SalesanalyticsDtos.cs
	namespace 	
EcomLib
 
. 
Dtos 
. 
AnalyticsDtos $
{ 
public		 

class		 
SalesByCategoryDto		 #
{

 
public 
string 
CategoryName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
decimal 

TotalSales !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
public 

class 
SalesByProductDto "
{ 
public 
string 
ProductName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 

TotalSales !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
public 

class 
SalesBySellerDto !
{ 
public 
string 

SellerName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
decimal 

TotalSales !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
public 

class 
DailySalesDto 
{ 
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public 
decimal 

TotalSales !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
}!! ∆
aD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Data\AppDbContextFactory.cs
	namespace 	
EcomLib
 
. 
Data 
{ 
	namespace 
EcomLib 
. 
Data 
{ 
public 
class 
AppDbContextFactory (
:) *'
IDesignTimeDbContextFactory+ F
<F G
AppDbContextG S
>S T
{ 	
public 
AppDbContext 
CreateDbContext  /
(/ 0
string0 6
[6 7
]7 8
args9 =
)= >
{ 
IConfigurationRoot "
configuration# 0
=1 2
new3 6 
ConfigurationBuilder7 K
(K L
)L M
. 
SetBasePath  
(  !
	Directory! *
.* +
GetCurrentDirectory+ >
(> ?
)? @
)@ A
. 
AddJsonFile  
(  !
$str! 3
)3 4
. 
Build 
( 
) 
; 
var 
connectionString $
=% &
configuration' 4
.4 5
GetConnectionString5 H
(H I
$strI \
)\ ]
;] ^
var 
optionsBuilder "
=# $
new% (#
DbContextOptionsBuilder) @
<@ A
AppDbContextA M
>M N
(N O
)O P
;P Q
optionsBuilder   
.   
UseSqlServer   +
(  + ,
connectionString  , <
)  < =
;  = >
return"" 
new"" 
AppDbContext"" '
(""' (
optionsBuilder""( 6
.""6 7
Options""7 >
,""> ?
configuration""@ M
)""M N
;""N O
}## 
}$$ 	
}%% 
}'' ¸◊
ZD:\DOTNET FSD Training\CaseStudy\Ecommerce_Backend\QuitQ_Ecom\EcomLib\Data\AppDbContext.cs
	namespace 	
	EcomQuitQ
 
. 
Data 
{ 
public 

class 
AppDbContext 
: 
	DbContext '
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
DbSet 
< 
User 
> 
Users  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DbSet 
< 
PersonalDetails $
>$ %
PersonalDetails& 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
DbSet 
< 
SellerDetails "
>" #
SellerDetails$ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
DbSet 
< 
Address 
> 
	Addresses '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
DbSet 
< 
Cart 
> 
Carts  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DbSet 
< 
CartItem 
> 
	CartItems (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
DbSet 
< 
Order 
> 
Orders "
{# $
get% (
;( )
set* -
;- .
}/ 0
public   
DbSet   
<   
	OrderItem   
>   

OrderItems    *
{  + ,
get  - 0
;  0 1
set  2 5
;  5 6
}  7 8
public!! 
DbSet!! 
<!! 
Product!! 
>!! 
Products!! &
{!!' (
get!!) ,
;!!, -
set!!. 1
;!!1 2
}!!3 4
public"" 
DbSet"" 
<"" 
Brand"" 
>"" 
Brands"" "
{""# $
get""% (
;""( )
set""* -
;""- .
}""/ 0
public## 
DbSet## 
<## 
Payment## 
>## 
Payments## &
{##' (
get##) ,
;##, -
set##. 1
;##1 2
}##3 4
public$$ 
DbSet$$ 
<$$ 
ProductReview$$ "
>$$" #
ProductReviews$$$ 2
{$$3 4
get$$5 8
;$$8 9
set$$: =
;$$= >
}$$? @
public%% 
DbSet%% 
<%% 
	Inventory%% 
>%% 
Inventories%%  +
{%%, -
get%%. 1
;%%1 2
set%%3 6
;%%6 7
}%%8 9
public&& 
DbSet&& 
<&& 
Discount&& 
>&& 
	Discounts&& (
{&&) *
get&&+ .
;&&. /
set&&0 3
;&&3 4
}&&5 6
public'' 
DbSet'' 
<'' 
ProductDiscount'' $
>''$ %
ProductDiscounts''& 6
{''7 8
get''9 <
;''< =
set''> A
;''A B
}''C D
public(( 
DbSet(( 
<(( 
AuditLog(( 
>(( 
	AuditLogs(( (
{(() *
get((+ .
;((. /
set((0 3
;((3 4
}((5 6
public)) 
DbSet)) 
<)) 
SubCategory))  
>))  !
SubCategories))" /
{))0 1
get))2 5
;))5 6
set))7 :
;)): ;
}))< =
public** 
DbSet** 
<** 
ParentCategory** #
>**# $
ParentCategories**% 5
{**6 7
get**8 ;
;**; <
set**= @
;**@ A
}**B C
public++ 
DbSet++ 
<++ 
Wishlist++ 
>++ 
	Wishlists++ (
{++) *
get+++ .
;++. /
set++0 3
;++3 4
}++5 6
public-- 
AppDbContext-- 
(-- 
DbContextOptions-- ,
<--, -
AppDbContext--- 9
>--9 :
options--; B
,--B C
IConfiguration--D R
configuration--S `
)--` a
:.. 
base.. 
(.. 
options.. 
).. 
{// 	
_configuration00 
=00 
configuration00 *
;00* +
}11 	
public22 
AppDbContext22 
(22 
DbContextOptions22 ,
<22, -
AppDbContext22- 9
>229 :
options22; B
)22B C
:22D E
base22F J
(22J K
options22K R
)22R S
{33 	
}44 	
	protected66 
override66 
void66 
OnModelCreating66  /
(66/ 0
ModelBuilder660 <
modelBuilder66= I
)66I J
{77 	
modelBuilder:: 
.:: 
Entity:: 
<::  
User::  $
>::$ %
(::% &
)::& '
.;; 
HasKey;; 
(;; 
u;; 
=>;; 
u;; 
.;; 
UserId;; %
);;% &
;;;& '
modelBuilder>> 
.>> 
Entity>> 
<>>  
PersonalDetails>>  /
>>>/ 0
(>>0 1
)>>1 2
.?? 
HasKey?? 
(?? 
p?? 
=>?? 
p?? 
.?? 
PersonalDetailsId?? 0
)??0 1
;??1 2
modelBuilderBB 
.BB 
EntityBB 
<BB  
SellerDetailsBB  -
>BB- .
(BB. /
)BB/ 0
.CC 
HasKeyCC 
(CC 
sCC 
=>CC 
sCC 
.CC 
SellerIdCC '
)CC' (
;CC( )
modelBuilderFF 
.FF 
EntityFF 
<FF  
AddressFF  '
>FF' (
(FF( )
)FF) *
.GG 
HasKeyGG 
(GG 
aGG 
=>GG 
aGG 
.GG 
	AddressIdGG (
)GG( )
;GG) *
modelBuilderJJ 
.JJ 
EntityJJ 
<JJ  
CartJJ  $
>JJ$ %
(JJ% &
)JJ& '
.KK 
HasKeyKK 
(KK 
cKK 
=>KK 
cKK 
.KK 
CartIdKK %
)KK% &
;KK& '
modelBuilderNN 
.NN 
EntityNN 
<NN  
CartItemNN  (
>NN( )
(NN) *
)NN* +
.OO 
HasKeyOO 
(OO 
ciOO 
=>OO 
ciOO  
.OO  !

CartItemIdOO! +
)OO+ ,
;OO, -
modelBuilderRR 
.RR 
EntityRR 
<RR  
OrderRR  %
>RR% &
(RR& '
)RR' (
.SS 
HasKeySS 
(SS 
oSS 
=>SS 
oSS 
.SS 
OrderIdSS &
)SS& '
;SS' (
modelBuilderVV 
.VV 
EntityVV 
<VV  
	OrderItemVV  )
>VV) *
(VV* +
)VV+ ,
.WW 
HasKeyWW 
(WW 
oiWW 
=>WW 
oiWW  
.WW  !
OrderItemIdWW! ,
)WW, -
;WW- .
modelBuilderZZ 
.ZZ 
EntityZZ 
<ZZ  
PaymentZZ  '
>ZZ' (
(ZZ( )
)ZZ) *
.[[ 
HasKey[[ 
([[ 
p[[ 
=>[[ 
p[[ 
.[[ 
	PaymentId[[ (
)[[( )
;[[) *
modelBuilder^^ 
.^^ 
Entity^^ 
<^^  
ProductReview^^  -
>^^- .
(^^. /
)^^/ 0
.__ 
HasKey__ 
(__ 
pr__ 
=>__ 
pr__  
.__  !
ReviewId__! )
)__) *
;__* +
modelBuilderbb 
.bb 
Entitybb 
<bb  
	Inventorybb  )
>bb) *
(bb* +
)bb+ ,
.cc 
HasKeycc 
(cc 
icc 
=>cc 
icc 
.cc 
InventoryIdcc *
)cc* +
;cc+ ,
modelBuilderff 
.ff 
Entityff 
<ff  
Discountff  (
>ff( )
(ff) *
)ff* +
.gg 
HasKeygg 
(gg 
dgg 
=>gg 
dgg 
.gg 

DiscountIdgg )
)gg) *
;gg* +
modelBuilderjj 
.jj 
Entityjj 
<jj  
ProductDiscountjj  /
>jj/ 0
(jj0 1
)jj1 2
.kk 
HasKeykk 
(kk 
pdkk 
=>kk 
pdkk  
.kk  !
ProductDiscountIdkk! 2
)kk2 3
;kk3 4
modelBuildernn 
.nn 
Entitynn 
<nn  
AuditLognn  (
>nn( )
(nn) *
)nn* +
.oo 
HasKeyoo 
(oo 
aoo 
=>oo 
aoo 
.oo 
LogIdoo $
)oo$ %
;oo% &
modelBuilderrr 
.rr 
Entityrr 
<rr  
Brandrr  %
>rr% &
(rr& '
)rr' (
.ss 
HasKeyss 
(ss 
bss 
=>ss 
bss 
.ss 
BrandIdss &
)ss& '
;ss' (
modelBuildervv 
.vv 
Entityvv 
<vv  
Wishlistvv  (
>vv( )
(vv) *
)vv* +
.ww 
HasKeyww 
(ww 
bww 
=>ww 
bww 
.ww 

WishlistIdww )
)ww) *
;ww* +
modelBuilderzz 
.zz 
Entityzz 
<zz  
Userzz  $
>zz$ %
(zz% &
)zz& '
.{{ 
HasOne{{ 
({{ 
u{{ 
=>{{ 
u{{ 
.{{ 
PersonalDetails{{ .
){{. /
.|| 
WithOne|| 
(|| 
p|| 
=>|| 
p|| 
.||  
User||  $
)||$ %
.}} 
HasForeignKey}} 
<}} 
PersonalDetails}} .
>}}. /
(}}/ 0
p}}0 1
=>}}2 4
p}}5 6
.}}6 7
UserId}}7 =
)}}= >
;}}> ?
modelBuilder 
. 
Entity 
<  
User  $
>$ %
(% &
)& '
.
ÄÄ 
HasOne
ÄÄ 
(
ÄÄ 
u
ÄÄ 
=>
ÄÄ 
u
ÄÄ 
.
ÄÄ 
SellerDetails
ÄÄ ,
)
ÄÄ, -
.
ÅÅ 
WithOne
ÅÅ 
(
ÅÅ 
s
ÅÅ 
=>
ÅÅ 
s
ÅÅ 
.
ÅÅ  
User
ÅÅ  $
)
ÅÅ$ %
.
ÇÇ 
HasForeignKey
ÇÇ 
<
ÇÇ 
SellerDetails
ÇÇ ,
>
ÇÇ, -
(
ÇÇ- .
s
ÇÇ. /
=>
ÇÇ0 2
s
ÇÇ3 4
.
ÇÇ4 5
UserId
ÇÇ5 ;
)
ÇÇ; <
;
ÇÇ< =
modelBuilder
ÑÑ 
.
ÑÑ 
Entity
ÑÑ 
<
ÑÑ  
User
ÑÑ  $
>
ÑÑ$ %
(
ÑÑ% &
)
ÑÑ& '
.
ÖÖ 
HasOne
ÖÖ 
(
ÖÖ 
u
ÖÖ 
=>
ÖÖ 
u
ÖÖ 
.
ÖÖ 
Address
ÖÖ &
)
ÖÖ& '
.
ÜÜ 
WithOne
ÜÜ 
(
ÜÜ 
a
ÜÜ 
=>
ÜÜ 
a
ÜÜ 
.
ÜÜ  
User
ÜÜ  $
)
ÜÜ$ %
.
áá 
HasForeignKey
áá 
<
áá 
Address
áá &
>
áá& '
(
áá' (
a
áá( )
=>
áá* ,
a
áá- .
.
áá. /
UserId
áá/ 5
)
áá5 6
;
áá6 7
modelBuilder
ââ 
.
ââ 
Entity
ââ 
<
ââ  
Cart
ââ  $
>
ââ$ %
(
ââ% &
)
ââ& '
.
ää 
HasOne
ää 
(
ää 
c
ää 
=>
ää 
c
ää 
.
ää 
User
ää #
)
ää# $
.
ãã 
WithMany
ãã 
(
ãã 
u
ãã 
=>
ãã 
u
ãã  
.
ãã  !
Carts
ãã! &
)
ãã& '
.
åå 
HasForeignKey
åå 
(
åå 
c
åå  
=>
åå! #
c
åå$ %
.
åå% &
UserId
åå& ,
)
åå, -
;
åå- .
modelBuilder
éé 
.
éé 
Entity
éé 
<
éé  
Cart
éé  $
>
éé$ %
(
éé% &
)
éé& '
.
èè 
HasMany
èè 
(
èè 
c
èè 
=>
èè 
c
èè 
.
èè  
	CartItems
èè  )
)
èè) *
.
êê 
WithOne
êê 
(
êê 
ci
êê 
=>
êê 
ci
êê !
.
êê! "
Cart
êê" &
)
êê& '
.
ëë 
HasForeignKey
ëë 
(
ëë 
ci
ëë !
=>
ëë" $
ci
ëë% '
.
ëë' (
CartId
ëë( .
)
ëë. /
;
ëë/ 0
modelBuilder
ìì 
.
ìì 
Entity
ìì 
<
ìì  
CartItem
ìì  (
>
ìì( )
(
ìì) *
)
ìì* +
.
îî 
HasOne
îî 
(
îî 
ci
îî 
=>
îî 
ci
îî  
.
îî  !
Product
îî! (
)
îî( )
.
ïï 
WithMany
ïï 
(
ïï 
p
ïï 
=>
ïï 
p
ïï  
.
ïï  !
	CartItems
ïï! *
)
ïï* +
.
ññ 
HasForeignKey
ññ 
(
ññ 
ci
ññ !
=>
ññ" $
ci
ññ% '
.
ññ' (
	ProductId
ññ( 1
)
ññ1 2
;
ññ2 3
modelBuilder
òò 
.
òò 
Entity
òò 
<
òò  
Order
òò  %
>
òò% &
(
òò& '
)
òò' (
.
ôô 
HasOne
ôô 
(
ôô 
o
ôô 
=>
ôô 
o
ôô 
.
ôô 
User
ôô #
)
ôô# $
.
öö 
WithMany
öö 
(
öö 
u
öö 
=>
öö 
u
öö  
.
öö  !
Orders
öö! '
)
öö' (
.
õõ 
HasForeignKey
õõ 
(
õõ 
o
õõ  
=>
õõ! #
o
õõ$ %
.
õõ% &
UserId
õõ& ,
)
õõ, -
;
õõ- .
modelBuilder
ùù 
.
ùù 
Entity
ùù 
<
ùù  
Order
ùù  %
>
ùù% &
(
ùù& '
)
ùù' (
.
ûû 
HasOne
ûû 
(
ûû 
o
ûû 
=>
ûû 
o
ûû 
.
ûû 
ShippingAddress
ûû .
)
ûû. /
.
üü 
WithMany
üü 
(
üü 
)
üü 
.
†† 
HasForeignKey
†† 
(
†† 
o
††  
=>
††! #
o
††$ %
.
††% &
ShippingAddressId
††& 7
)
††7 8
.
°° 
OnDelete
°° 
(
°° 
DeleteBehavior
°° (
.
°°( )
Restrict
°°) 1
)
°°1 2
;
°°2 3
modelBuilder
££ 
.
££ 
Entity
££ 
<
££  
Order
££  %
>
££% &
(
££& '
)
££' (
.
§§ 
HasOne
§§ 
(
§§ 
o
§§ 
=>
§§ 
o
§§ 
.
§§ 
BillingAddress
§§ -
)
§§- .
.
•• 
WithMany
•• 
(
•• 
)
•• 
.
¶¶ 
HasForeignKey
¶¶ 
(
¶¶ 
o
¶¶  
=>
¶¶! #
o
¶¶$ %
.
¶¶% &
BillingAddressId
¶¶& 6
)
¶¶6 7
.
ßß 
OnDelete
ßß 
(
ßß 
DeleteBehavior
ßß (
.
ßß( )
Restrict
ßß) 1
)
ßß1 2
;
ßß2 3
modelBuilder
©© 
.
©© 
Entity
©© 
<
©©  
Order
©©  %
>
©©% &
(
©©& '
)
©©' (
.
™™ 
HasMany
™™ 
(
™™ 
o
™™ 
=>
™™ 
o
™™ 
.
™™  

OrderItems
™™  *
)
™™* +
.
´´ 
WithOne
´´ 
(
´´ 
oi
´´ 
=>
´´ 
oi
´´ !
.
´´! "
Order
´´" '
)
´´' (
.
¨¨ 
HasForeignKey
¨¨ 
(
¨¨ 
oi
¨¨ !
=>
¨¨" $
oi
¨¨% '
.
¨¨' (
OrderId
¨¨( /
)
¨¨/ 0
;
¨¨0 1
modelBuilder
ÆÆ 
.
ÆÆ 
Entity
ÆÆ 
<
ÆÆ  
	OrderItem
ÆÆ  )
>
ÆÆ) *
(
ÆÆ* +
)
ÆÆ+ ,
.
ØØ 
HasOne
ØØ 
(
ØØ 
oi
ØØ 
=>
ØØ 
oi
ØØ  
.
ØØ  !
Product
ØØ! (
)
ØØ( )
.
∞∞ 
WithMany
∞∞ 
(
∞∞ 
p
∞∞ 
=>
∞∞ 
p
∞∞  
.
∞∞  !

OrderItems
∞∞! +
)
∞∞+ ,
.
±± 
HasForeignKey
±± 
(
±± 
oi
±± !
=>
±±" $
oi
±±% '
.
±±' (
	ProductId
±±( 1
)
±±1 2
.
≤≤ 
OnDelete
≤≤ 
(
≤≤ 
DeleteBehavior
≤≤ (
.
≤≤( )
Restrict
≤≤) 1
)
≤≤1 2
;
≤≤2 3
modelBuilder
≥≥ 
.
≥≥ 
Entity
≥≥ 
<
≥≥  
	OrderItem
≥≥  )
>
≥≥) *
(
≥≥* +
)
≥≥+ ,
.
¥¥ 
HasOne
¥¥ 
(
¥¥ 
oi
¥¥ 
=>
¥¥ 
oi
¥¥  
.
¥¥  !
Seller
¥¥! '
)
¥¥' (
.
µµ 
WithMany
µµ 
(
µµ 
)
µµ 
.
∂∂ 
HasForeignKey
∂∂ 
(
∂∂ 
oi
∂∂ !
=>
∂∂" $
oi
∂∂% '
.
∂∂' (
SellerId
∂∂( 0
)
∂∂0 1
.
∑∑ 
OnDelete
∑∑ 
(
∑∑ 
DeleteBehavior
∑∑ (
.
∑∑( )
Restrict
∑∑) 1
)
∑∑1 2
;
∑∑2 3
modelBuilder
ππ 
.
ππ 
Entity
ππ 
<
ππ  
Payment
ππ  '
>
ππ' (
(
ππ( )
)
ππ) *
.
∫∫ 
HasOne
∫∫ 
(
∫∫ 
p
∫∫ 
=>
∫∫ 
p
∫∫ 
.
∫∫ 
Order
∫∫ $
)
∫∫$ %
.
ªª 
WithMany
ªª 
(
ªª 
o
ªª 
=>
ªª 
o
ªª  
.
ªª  !
Payments
ªª! )
)
ªª) *
.
ºº 
HasForeignKey
ºº 
(
ºº 
p
ºº  
=>
ºº! #
p
ºº$ %
.
ºº% &
OrderId
ºº& -
)
ºº- .
;
ºº. /
modelBuilder
ææ 
.
ææ 
Entity
ææ 
<
ææ  
ProductReview
ææ  -
>
ææ- .
(
ææ. /
)
ææ/ 0
.
øø 
HasOne
øø 
(
øø 
pr
øø 
=>
øø 
pr
øø  
.
øø  !
Product
øø! (
)
øø( )
.
¿¿ 
WithMany
¿¿ 
(
¿¿ 
p
¿¿ 
=>
¿¿ 
p
¿¿  
.
¿¿  !
ProductReviews
¿¿! /
)
¿¿/ 0
.
¡¡ 
HasForeignKey
¡¡ 
(
¡¡ 
pr
¡¡ !
=>
¡¡" $
pr
¡¡% '
.
¡¡' (
	ProductId
¡¡( 1
)
¡¡1 2
;
¡¡2 3
modelBuilder
√√ 
.
√√ 
Entity
√√ 
<
√√  
ProductReview
√√  -
>
√√- .
(
√√. /
)
√√/ 0
.
ƒƒ 
HasOne
ƒƒ 
(
ƒƒ 
pr
ƒƒ 
=>
ƒƒ 
pr
ƒƒ  
.
ƒƒ  !
User
ƒƒ! %
)
ƒƒ% &
.
≈≈ 
WithMany
≈≈ 
(
≈≈ 
u
≈≈ 
=>
≈≈ 
u
≈≈  
.
≈≈  !
ProductReviews
≈≈! /
)
≈≈/ 0
.
∆∆ 
HasForeignKey
∆∆ 
(
∆∆ 
pr
∆∆ !
=>
∆∆" $
pr
∆∆% '
.
∆∆' (
UserId
∆∆( .
)
∆∆. /
;
∆∆/ 0
modelBuilder
»» 
.
»» 
Entity
»» 
<
»»  
	Inventory
»»  )
>
»») *
(
»»* +
)
»»+ ,
.
…… 
HasOne
…… 
(
…… 
i
…… 
=>
…… 
i
…… 
.
…… 
Product
…… &
)
……& '
.
   
WithOne
   
(
   
p
   
=>
   
p
   
.
    
	Inventory
    )
)
  ) *
.
ÀÀ 
HasForeignKey
ÀÀ 
<
ÀÀ 
	Inventory
ÀÀ (
>
ÀÀ( )
(
ÀÀ) *
i
ÀÀ* +
=>
ÀÀ, .
i
ÀÀ/ 0
.
ÀÀ0 1
	ProductId
ÀÀ1 :
)
ÀÀ: ;
;
ÀÀ; <
modelBuilder
ÕÕ 
.
ÕÕ 
Entity
ÕÕ 
<
ÕÕ  
ProductDiscount
ÕÕ  /
>
ÕÕ/ 0
(
ÕÕ0 1
)
ÕÕ1 2
.
ŒŒ 
HasOne
ŒŒ 
(
ŒŒ 
pd
ŒŒ 
=>
ŒŒ 
pd
ŒŒ  
.
ŒŒ  !
Product
ŒŒ! (
)
ŒŒ( )
.
œœ 
WithMany
œœ 
(
œœ 
p
œœ 
=>
œœ 
p
œœ  
.
œœ  !
ProductDiscounts
œœ! 1
)
œœ1 2
.
–– 
HasForeignKey
–– 
(
–– 
pd
–– !
=>
––" $
pd
––% '
.
––' (
	ProductId
––( 1
)
––1 2
;
––2 3
modelBuilder
““ 
.
““ 
Entity
““ 
<
““  
ProductDiscount
““  /
>
““/ 0
(
““0 1
)
““1 2
.
”” 
HasOne
”” 
(
”” 
pd
”” 
=>
”” 
pd
””  
.
””  !
Discount
””! )
)
””) *
.
‘‘ 
WithMany
‘‘ 
(
‘‘ 
d
‘‘ 
=>
‘‘ 
d
‘‘  
.
‘‘  !
ProductDiscounts
‘‘! 1
)
‘‘1 2
.
’’ 
HasForeignKey
’’ 
(
’’ 
pd
’’ !
=>
’’" $
pd
’’% '
.
’’' (

DiscountId
’’( 2
)
’’2 3
;
’’3 4
modelBuilder
◊◊ 
.
◊◊ 
Entity
◊◊ 
<
◊◊  
SubCategory
◊◊  +
>
◊◊+ ,
(
◊◊, -
)
◊◊- .
.
ÿÿ 
HasOne
ÿÿ 
(
ÿÿ 
sc
ÿÿ 
=>
ÿÿ 
sc
ÿÿ  
.
ÿÿ  !
ParentCategory
ÿÿ! /
)
ÿÿ/ 0
.
ŸŸ 
WithMany
ŸŸ 
(
ŸŸ 
pc
ŸŸ 
=>
ŸŸ 
pc
ŸŸ  "
.
ŸŸ" #
SubCategories
ŸŸ# 0
)
ŸŸ0 1
.
⁄⁄ 
HasForeignKey
⁄⁄ 
(
⁄⁄ 
sc
⁄⁄ !
=>
⁄⁄" $
sc
⁄⁄% '
.
⁄⁄' (
ParentCategoryId
⁄⁄( 8
)
⁄⁄8 9
.
€€ 
OnDelete
€€ 
(
€€ 
DeleteBehavior
€€ (
.
€€( )
Restrict
€€) 1
)
€€1 2
;
€€2 3
modelBuilder
›› 
.
›› 
Entity
›› 
<
››  
Brand
››  %
>
››% &
(
››& '
)
››' (
.
ﬁﬁ 
HasMany
ﬁﬁ 
(
ﬁﬁ 
b
ﬁﬁ 
=>
ﬁﬁ 
b
ﬁﬁ 
.
ﬁﬁ  
Products
ﬁﬁ  (
)
ﬁﬁ( )
.
ﬂﬂ 
WithOne
ﬂﬂ 
(
ﬂﬂ 
p
ﬂﬂ 
=>
ﬂﬂ 
p
ﬂﬂ 
.
ﬂﬂ  
Brand
ﬂﬂ  %
)
ﬂﬂ% &
.
‡‡ 
HasForeignKey
‡‡ 
(
‡‡ 
p
‡‡  
=>
‡‡! #
p
‡‡$ %
.
‡‡% &
BrandId
‡‡& -
)
‡‡- .
.
·· 
OnDelete
·· 
(
·· 
DeleteBehavior
·· (
.
··( )
Restrict
··) 1
)
··1 2
;
··2 3
modelBuilder
„„ 
.
„„ 
Entity
„„ 
<
„„  
Wishlist
„„  (
>
„„( )
(
„„) *
)
„„* +
.
‰‰ 
HasOne
‰‰ 
(
‰‰ 
w
‰‰ 
=>
‰‰ 
w
‰‰ 
.
‰‰ 
User
‰‰ #
)
‰‰# $
.
ÂÂ 
WithMany
ÂÂ 
(
ÂÂ 
u
ÂÂ 
=>
ÂÂ 
u
ÂÂ  
.
ÂÂ  !
	Wishlists
ÂÂ! *
)
ÂÂ* +
.
ÊÊ 
HasForeignKey
ÊÊ 
(
ÊÊ 
w
ÊÊ  
=>
ÊÊ! #
w
ÊÊ$ %
.
ÊÊ% &
UserId
ÊÊ& ,
)
ÊÊ, -
;
ÊÊ- .
modelBuilder
ËË 
.
ËË 
Entity
ËË 
<
ËË  
Wishlist
ËË  (
>
ËË( )
(
ËË) *
)
ËË* +
.
ÈÈ 
HasOne
ÈÈ 
(
ÈÈ 
w
ÈÈ 
=>
ÈÈ 
w
ÈÈ 
.
ÈÈ 
Product
ÈÈ &
)
ÈÈ& '
.
ÍÍ 
WithMany
ÍÍ 
(
ÍÍ 
p
ÍÍ 
=>
ÍÍ 
p
ÍÍ  
.
ÍÍ  !
	Wishlists
ÍÍ! *
)
ÍÍ* +
.
ÎÎ 
HasForeignKey
ÎÎ 
(
ÎÎ 
w
ÎÎ  
=>
ÎÎ! #
w
ÎÎ$ %
.
ÎÎ% &
	ProductId
ÎÎ& /
)
ÎÎ/ 0
;
ÎÎ0 1
modelBuilder
ÓÓ 
.
ÓÓ 
Entity
ÓÓ 
<
ÓÓ  
Product
ÓÓ  '
>
ÓÓ' (
(
ÓÓ( )
)
ÓÓ) *
.
ÔÔ 
Property
ÔÔ 
(
ÔÔ 
p
ÔÔ 
=>
ÔÔ 
p
ÔÔ  
.
ÔÔ  !
Price
ÔÔ! &
)
ÔÔ& '
.
 
HasColumnType
 
(
 
$str
 .
)
. /
;
/ 0
modelBuilder
ÚÚ 
.
ÚÚ 
Entity
ÚÚ 
<
ÚÚ  
Order
ÚÚ  %
>
ÚÚ% &
(
ÚÚ& '
)
ÚÚ' (
.
ÛÛ 
Property
ÛÛ 
(
ÛÛ 
o
ÛÛ 
=>
ÛÛ 
o
ÛÛ  
.
ÛÛ  !
TotalAmount
ÛÛ! ,
)
ÛÛ, -
.
ÙÙ 
HasColumnType
ÙÙ 
(
ÙÙ 
$str
ÙÙ .
)
ÙÙ. /
;
ÙÙ/ 0
modelBuilder
ˆˆ 
.
ˆˆ 
Entity
ˆˆ 
<
ˆˆ  
Payment
ˆˆ  '
>
ˆˆ' (
(
ˆˆ( )
)
ˆˆ) *
.
˜˜ 
Property
˜˜ 
(
˜˜ 
p
˜˜ 
=>
˜˜ 
p
˜˜  
.
˜˜  !
PaymentAmount
˜˜! .
)
˜˜. /
.
¯¯ 
HasColumnType
¯¯ 
(
¯¯ 
$str
¯¯ .
)
¯¯. /
;
¯¯/ 0
base
˙˙ 
.
˙˙ 
OnModelCreating
˙˙  
(
˙˙  !
modelBuilder
˙˙! -
)
˙˙- .
;
˙˙. /
}
¸¸ 	
}
˛˛ 
}ˇˇ 