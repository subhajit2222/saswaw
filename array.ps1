$fruits='apple','mango','banana'
$fruits

$CourseVideos_1=@(
    'installation'
    'videos'
    'downloads'
)
$CourseVideos_1

$CourseVideos_1[0]


#hash tables
#helps to search values based on keys keys/values

$fruits=@{
    sweet='mango'
    citric='orange'
    energy='banana'
}

$fruits['sweet']
$fruits.sweet

$fruits.Add('lime','mousambi')


$course=[PSCustomObject]@{
    Name = "Az-104"
    Id = 22018
    Rating = 4.7
}
$course
$course.Id 


$coursera=@(
    [PSCustomObject]@{
        Name = 'fruit'
        value= 'mango'
    }
    [PSCustomObject]@{
        Name = 'course'
        value = 'az104'
    }
)

$coursera[1].value


