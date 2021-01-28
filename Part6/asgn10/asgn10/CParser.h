using namespace std;
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include "CToken.h"
#include "CLex.h"



class CParser
{
private:
	CLex Lexer;
	int endfile;
	std::vector<std::string> elems;
	std::vector<std::string> elemsType;

	/**
	 * \brief
	 */
	CToken curToken;
	CToken prevToken;
	auto increment() -> void;


	void pascal()
	{
		block();
		if (curToken.tokenValue == ".")
		{
			increment();
		}
		else
		{
			cout << "error exiting";
		}
	}

	void block()
	{
		PFV();

		if (curToken.tokenValue == "begin")
		{
			while (curToken.tokenValue != "end") {
				increment();
				sta();
				mstat();
			}
			if (curToken.tokenValue == "end")
			{
				increment();
			}
			else
			{
				cout << "error exiting block" << endl;
				system("pause");
			}
		}
	}

	void sta()
	{
		if (curToken.tokenType == "word")
		{
			string varName = curToken.tokenValue;
			string varType = "";
			auto it = std::find(elems.begin(), elems.end(), curToken.tokenValue);
			int leftVarIndex = 0;
			int rightVarIndex = 0;

			if (it != elems.end()) {
				// Here need to check the DataType
				leftVarIndex = it - elems.begin();
				varType = elemsType[leftVarIndex];
				increment();
			} else {
				cout << " " << varName << " " << "identifier not found.";
				E();
				while (curToken.tokenValue != ";") {
					increment();
				}
				increment();
				sta();
			}
			if (curToken.tokenValue == ":=")
			{
				increment();
				while (curToken.tokenValue != ";") {

					if (curToken.tokenType == "word") {
						if (varType == "boolean") {
							if (curToken.tokenValue == "true" || curToken.tokenValue == "false") {
								increment();
							}
						}
						else if (std::find(elems.begin(), elems.end(), curToken.tokenValue) == elems.end()) {
							cout << varName << "identifier not found.";
							increment();
							continue;
						}
						else {
							it = std::find(elems.begin(), elems.end(), curToken.tokenValue);
							if (it != elems.end()) {
								// Here need to check the DataType
								rightVarIndex = it - elems.begin();
								if (elemsType[leftVarIndex] != elemsType[rightVarIndex]) {
									cout << "\n" + elems[leftVarIndex] + " and " + elems[rightVarIndex] + " " + "Type Mismatch";
									cout << "\n" + elems[leftVarIndex] + " is " + elemsType[leftVarIndex] + "\n";
									cout << "\n" + elems[rightVarIndex] + " is " + elemsType[rightVarIndex] + "\n";
									E();
								}
								increment();
							}
						}
					}
					increment();
				}
				increment();
				sta();
			} 
		} else if (curToken.tokenValue == "if")
		{
			increment();
			E();
			if (curToken.tokenValue == "then")
			{
				increment();
				sta();
				statprime();
			}
			else
			{
				cout << "error";
			}
		} else if (curToken.tokenValue == "while")
		{
			increment();
			E();
			if (curToken.tokenValue == "do")
			{
				increment();
				sta();
			}
			else
			{
				cout << "error";
			}
		} else if (curToken.tokenValue == "begin")
		{
			// Here the prevToken and the next token to store and loop and complete.
			increment();
			sta();
			mstat();
			increment();
		} else if (curToken.tokenValue == "end")
		{
			// Here the prevToken and the next token to store and loop and complete.
			increment();
			cout << "Successfully parsed";

		}
	}

	void statprime()
	{
		if (curToken.tokenValue == "else")
		{
			increment();
			sta();
		}
	}

	void mstat()
	{
		if (curToken.tokenValue == ";")
		{
			increment();
			sta();
			mstat();
		}
	}
	void T()
	{
		TR();
		Tprime();
	}

	void E()
	{
		C();
	}

	void C()
	{
		CR();
		CRPrime();
	}

	void CRPrime()
	{
		if (curToken.tokenValue == "<" || curToken.tokenValue == ">" || curToken.tokenValue == "=")
		{
			increment();
			CR();
			CRPrime();
		}
	}

	void CR()
	{
		T();
	}


	void Tprime()
	{
		if (curToken.tokenValue == "+" || curToken.tokenValue == "-")
		{
			// Here in this flow, the data for the arithmetic done
			increment();
			TR();
			Tprime();
		}
	}

	void TR()
	{
		F();
	}

	void F()
	{
		FR();
		Fprime();
	}

	void Fprime()
	{
		if (curToken.tokenValue == "*" || curToken.tokenValue == "/")
		{
			increment();
			FR();
			Fprime();
		}
	}

	void FR()
	{
		if (curToken.tokenType == "int" || curToken.tokenType == "real" || curToken.tokenType == "word")
		{
			increment();
		}
		else if (curToken.tokenValue == "+" || curToken.tokenValue == "-")
		{
			increment();
			TR();
		}
		else if (curToken.tokenValue == "(")
		{
			increment();
			E();
			if (curToken.tokenValue == ")")
			{
				increment();
			}
			else
			{
				cout << "wrong" << endl;
				system("pause");
				exit(0);
			}
		}
		else
		{
			cout << "wrong" << endl;
			system("pause");
			exit(0);
		}
	}

	void PFV()
	{
		if (curToken.tokenValue == "procedure")
		{

			increment();

			if (curToken.tokenType == "word")
			{
				increment();

				if (curToken.tokenValue == "(")
				{
					increment();
					Param();
					increment();
					PFV();
					sta();
				} else {
					cout << "wrong" << endl;
					system("pause");
					exit(0);
				}
			} else {
				cout << "wrong" << endl;
				system("pause");
				exit(0);
			}
		} else if (curToken.tokenValue == "function")
		{
			increment();

			if (curToken.tokenType == "word")
			{
				increment();

				if (curToken.tokenValue == "(")
				{
					increment();
					Param();
					if (curToken.tokenValue == ")")
					{
						increment();
						if (curToken.tokenValue == ":")
						{
							increment();

							Datatype();
							increment();

							if (curToken.tokenValue == ";")
							{
								increment();

								block();
								if (curToken.tokenValue == ";")
								{
									increment();

									PFV();

								}
								else
								{
									cout << "wrong" << endl;
									system("pause");
									exit(0);
								}
							}
							else
							{
								cout << "wrong" << endl;
								system("pause");
								exit(0);
							}
						}
						else
						{
							cout << "wrong" << endl;
							system("pause");
							exit(0);
						}
					}
					else
					{
						cout << "wrong" << endl;
						system("pause");
						exit(0);
					}


				}
				else
				{
					cout << "wrong" << endl;
					system("pause");
					exit(0);
				}

			}
			else
			{
				cout << "wrong" << endl;
				system("pause");
				exit(0);
			}

		}  else if (curToken.tokenValue == "var")
		{
			increment();
			int i = 0; // these many times with , the variable is declared
			while ((curToken.tokenValue != ":") && (curToken.tokenType != "rword")) {
				i++;
				elems.push_back(curToken.tokenValue);
				increment();
				if (curToken.tokenValue == ",") {
					increment(); continue;
				}
				if (curToken.tokenValue == ":") {
					increment();
					while (i > 0) {
						elemsType.push_back(curToken.tokenValue);
						i--;
					}
					increment();
				}
				if (curToken.tokenValue == ";")
					increment(); continue;
				if (curToken.tokenValue == "\n")
					increment(); continue;

			}
			if (curToken.tokenType == "rword")
				PFV();

		}
	}

	void Param()
	{
		int i = 0; // these many times with , the variable is declared
		while ((curToken.tokenValue != ")") ) {
			if (curToken.tokenValue == ";") {
				increment(); continue;
			}
			else if (curToken.tokenValue == "\n") {
				increment(); continue;
			}
			else if (curToken.tokenValue == ",") {
				increment(); continue;
			} else if (curToken.tokenValue == ":") {
				increment();
				Datatype();
				if (i > 0) {
					while (i > 0) {
						elemsType.push_back(curToken.tokenValue);
						Datatype();
						i--;
					}
				}
				increment(); continue;
			} else {
				if (curToken.tokenType != "rword") {
					elems.push_back(curToken.tokenValue);
					i++;
				}
				increment();
			}
		}
		if (curToken.tokenValue == ")") {
			increment();
		}
	}

	void MParam()
	{

		if (curToken.tokenValue == ";")
		{

			increment();

			OVar();
			increment();

			if (curToken.tokenType == "word")
			{
				increment();

				VarList();

				if (curToken.tokenValue == ":")
				{
					increment();

					Datatype();
					increment();


				}
				else
				{
					cout << "wrong" << endl;
					system("pause");
					exit(0);
				}
			}
			else
			{
				cout << "wrong" << endl;
				system("pause");
				exit(0);
			}

		}
	}

	void OVar()
	{
		if (curToken.tokenValue == "var")
		{

		}
	}

	void VarList()
	{
		if (curToken.tokenValue == ",")
		{
			increment();

			if (curToken.tokenType == "word")
			{
				increment();

				VarList();
			}
			else
			{
				cout << "wrong" << endl;
				system("pause");
				exit(0);
			}
		}
	}

	void Datatype()
	{
		if ((curToken.tokenValue != "integer") && (curToken.tokenValue != "boolean"))
		{
			cout << "Invalid data type" << endl;
			system("pause");
			exit(0);

		}
	}
	void MultiVar()
	{
		if (curToken.tokenType == "word")
		{
			increment();

			VarList();
			if (curToken.tokenValue == ":")
			{
				increment();

				Datatype();
				increment();

				if (curToken.tokenValue == ";")
				{
					increment();

					MultiVar();
				}
				else
				{
					cout << "wrong" << endl;
					system("pause");
					exit(0);
				}
			}
			else
			{
				cout << "wrong" << endl;
				system("pause");
				exit(0);
			}
		}
	}
public:
	CParser(string filename) : Lexer(filename)
	{
		increment();
		endfile = 0;
	}

	void parse()
	{
		pascal();
		if (endfile)
		{
			cout << "right" << endl;
			system("pause");
		}
		else
		{
			cout << "wrong" << endl;
			system("pause");
		}
	}

};

inline void CParser::increment()
{
	if (!Lexer.GetToken(curToken))
	{
		endfile = 1;
	}
}
