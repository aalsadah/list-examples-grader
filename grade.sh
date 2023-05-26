CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ ! -f student-submission/ListExamples.java ]]
then
echo "You have not submitted the correct file or it is named wrong"
fi

cp -r student-submission/ListExamples.java grading-area
cp -r TestListExamples.java grading-area
cp -r lib grading-area

cd grading-area

javac -cp $CPATH *.java

if [[ $? != 0 ]]
then
echo "File did not compile correctly"
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > results.txt

cat results.txt