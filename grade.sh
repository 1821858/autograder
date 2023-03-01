CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
RUNPATH=''

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd ./student-submission/

# Step 2
if [[ -f ListExamples.java ]]
then
    echo "ListExamples.java found"
else
    echo "ListExamples.java not found"
    exit
fi

# Step 3
cp ListExamples.java ..

cd ..

# javac /studentsubmission/ListExamples.java
javac -cp $CPATH ./ListExamples.java
if [[ $? -ne 0 ]]
then
    echo "Compilation Error"
else
    echo "Compilation Success"
fi

#javac -cp $CPATH ./TestListExamples.java

#javac -cp $CPATH /studentsubmission/TestListExamples

javac -cp $CPATH *.java

if [[ $? -ne 0 ]]
then
echo "Compilation error"
else
echo "Compilation successful"
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > results.txt
cat results.txt

