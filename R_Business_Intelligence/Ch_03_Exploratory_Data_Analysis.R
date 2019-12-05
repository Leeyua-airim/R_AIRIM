#Ch_03 Exploratory Data Analysis

#R의 데이터 형태
#Numeric - R에서 숫자는 기본적으로 Numeric으로 설정됩니다.

#Integer - 소숫점이 없는 정수이며, as.integer()를 통해 형태를 변환할 수 있다.
as.integer(1.23)

#Character - 문자열을 나타냅니다. as.character()을 통해 설정해 줄 수 있으며,
#cat()로 여러 문자들을 하나로 묶어 줄 수도 있다. 
as.character(1.23)

#Logical - TRUE 혹은 FALSE로 저장되는 값 입니다.
1 == 2
1 == 1

#Factor - 범주형 변수에 적용된다. 범주의 벡터를 각각의 level로 부호화해 저장.
#이러한 구분은 범주에 따라 데이터를 필터링하고 그룹을 만들 때 매우 유용

#데이터의 형태를 알고 싶을때 class()를 활용하면 된다.
class(1.23)
class("1.23")
