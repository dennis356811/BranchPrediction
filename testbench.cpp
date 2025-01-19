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
    unsigned long long cur_addr = 0;
    while(inFile >> in){
        if(in[0] == '@'){
            in.erase(0, 1);
            unsigned long long addr = stoull(in, nullptr, 16);
            for(unsigned long long i = 0; i < (addr - cur_addr); i++){
                data.push_back("00");
            }
            cur_addr = addr;
        }
        else{
            data.push_back(in);
            cur_addr++;
        }
    }
    /*
    for(int i = 0; i < data.size(); i+=4){
        string combine = data[i];
        for(int j = 1; j < 4; j++){
            combine = data[i+j] + combine;
        }
        answer.push_back(combine);
    }
    */
    for(int i = 0 ; i < data.size();i++){
        outFile << data[i] << /*" ////" << i << hex <<*/ endl;
    }
    return 0;
}