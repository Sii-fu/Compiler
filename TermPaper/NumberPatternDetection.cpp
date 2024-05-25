#include<bits/stdc++.h>
using namespace std;

int main()
{
    string s;
    cin>>s;
    int n=s.size();
    int cnt=0;
    for(int i=0;i<n;i++)
    {
        if(s[i]>='0' && s[i]<='9')
        {
            cnt++;
        }
    }
    if(cnt==n)
    {
        cout<<"Number"<<endl;
    }
    else
    {
        cout<<"Not Number"<<endl;
    }
    return 0;
}