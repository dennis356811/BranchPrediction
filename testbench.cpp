#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

int main(int argc, char* argv[]) {
    ifstream inFile;
    ofstream outFile;
    inFile.open(argv[1], ios::in);
    outFile.open("output.hex",ios::out);
    string in;
    vector<string> data, answer;
    while(inFile >> in){
        data.push_back(in);
    }
    for(int i = 0; i < data.size(); i+=4){
        string combine = data[i];
        for(int j = 1; j < 4; j++){
            combine = data[i+j] + combine;
        }
        answer.push_back(combine);
    }
    for(int i = 0 ; i < answer.size();i++){
        outFile << answer[i] << endl;
    }
    return 0;
}