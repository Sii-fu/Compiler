#include<bits/stdc++.h>
using namespace std;
#define N 66


class SymbolInfo
{
private:
    string symbol,type;
public:
    SymbolInfo(string symbol1, string type1)
    {
        symbol=symbol1;
        type=type1;
    }
    string getSymbol()
    {
        return symbol;
    }
    string gettype()
    {
        return type;
    }
    void display()
    {
        cout << "< " << symbol << ", " << type << " > ";
    }
};

int gethashID(string s)
{
    return (s[0] * 61) % N;
}

class SymbolTable
{
private:
    map<int,vector<SymbolInfo> > L;

public:
    SymbolTable()
    {
        for(int i=0; i<N; i++)
        {
            L[i]=vector<SymbolInfo>();
        }
    }
    void insert(SymbolInfo S)
    {
        int Id=gethashID(S.getSymbol());
        L[Id].push_back(S);
        cout << "Inserted at position " << Id << " " << L[Id].size()-1 << "\n";
    }



    void print()
    {
        for(auto x:L)
        {
            cout << x.first << "-> ";
            for(auto y:x.second)
            {
                y.display();
            }
            cout << endl;
        }
    }

    int findId(int id, string s)
    {
        for(int i=0; i<L[id].size(); i++)
        {
            if(L[id][i].getSymbol() == s)
            {
                return i;
            }
        }
        return -1;
    }
    void deleteSymbol(string s)
    {
        int id= gethashID(s);
        int pos = findId(id, s);
        if(pos == -1){
            cout << "Not found\n";
            return;
        }
        L[id].erase(L[id].begin()+pos);
        cout << "Deleted from (" << id << "," << pos << ")\n";
        
    }
};

int main()
{

    //file input output
    freopen("in.txt","r",stdin);
    freopen("out.txt","w",stdout);
    SymbolTable T;

    while(1)
    {
        // cout << "\nI. insert\n";
        // cout << "L. lookup\n";
        // cout << "D. delete\n";
        // cout << "P. print table\n\n";
        string ch;
        cin >> ch;
        if(ch=="I")
        {
            string symbol,type;
            cin >> symbol >> type;
            SymbolInfo a(symbol,type);
            T.insert(a);
        }
        else if(ch == "L")
        {
            string s;
            cin >> s;
            int id = gethashID(s);
            int pos = T.findId(id,s);
            if(pos == -1)
                cout << "Not found\n";
            else
                cout << "found at (" << id << "," << pos << ")\n";
        }
        else if(ch=="D")
        {
            string s;
            cin >> s;
            T.deleteSymbol(s);

        }
        else if(ch=="P")
        {
            cout << "Symbol Table:\n";
            T.print();
            cout << '\n';
        }
        else break;
    }
}