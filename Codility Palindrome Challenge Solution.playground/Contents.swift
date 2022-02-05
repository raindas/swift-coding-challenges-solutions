// Codility Palindrome Challenge
// =================================================================================
//Write a function solution that, given a string S of length N, returns any
//palindrome which can be obtained by replacing all of the question marks
//in S by lowercase letters ('a'-'z'). If no palindrome can be obtained, the
//function should return the string "NO"
//A palindrome is a string that reads the same both forwards and
//backwards. Some examples of palindromes are: "kayak", "radar", "mom"
// =================================================================================
//Examples:
//1. Given S = "?ab??a", the function should return "aabbaa"
//2. Given'S = "bab??a", the function should return "NO"
//3. Given S= "?a?", the function may return "aaa". It may also return "zaz"
//among other possible answers.
// =================================================================================
//Assume that:
//"Nis an integer within the range [1..1,000];
//string S consists only of lowercases letters (a'-'z') or"?'
// =================================================================================
//In your solution, focus on correctness. The performance of your solution
//will not be the focus of the assessment.
// =================================================================================
//Copyright 2009-2022 by Codility Limited. All Rights Reserved. Unauthorized copying,
//publication or disclosure prohibited.

func palindromeSolution(_ S: String) -> String {
    
    func randomAlphabet() -> String {
        let alphabets = "abcdefghijklmnopqrstuvwxyz"
        return String((0..<1).map{ _ in
            alphabets.randomElement()!
         })
    }
    
    func checkThroughAndFixPalindrome(stringCharacters: [String]) -> String {
        var index = 0
        var wordCharacters = stringCharacters
        
        while index < wordCharacters.count {
            // check if they are both empty characters
            if wordCharacters[index] == "?" && wordCharacters[(wordCharacters.count - index) - 1] == "?" {
                // add a random alphabet to both ends
                let generatedAlphabet:String = randomAlphabet()
                wordCharacters[index] = generatedAlphabet
                wordCharacters[(wordCharacters.count - index) - 1] = generatedAlphabet
                
            } else {
                // inherit from the other terminal end that is not empty
                if wordCharacters[index] == "?" {
                    wordCharacters[index] = wordCharacters[(wordCharacters.count - index) - 1]
                } else if wordCharacters[(wordCharacters.count - index) - 1] == "?" {
                    wordCharacters[(wordCharacters.count - index) - 1] = wordCharacters[index]
                } else {
                    // NOT A PALINDROME
                    finalWord = "NO"
                }
            }
            
            index += 1
        }
        
        return wordCharacters.joined()
    }
    
    var finalWord:String = String()
    
    // split the string into characters
    var StringCharacters: [String] = []
    
    for characters in S {
        StringCharacters.append(String(characters))
    }
    
    // check the first and last index of the String
    if StringCharacters[0] == StringCharacters[StringCharacters.count - 1] {
        
        finalWord = checkThroughAndFixPalindrome(stringCharacters: StringCharacters)
        
    } else {
        // inherit from the other terminal end that is not empty
        if StringCharacters[0] == "?" {
            StringCharacters[0] = StringCharacters[StringCharacters.count - 1]
            finalWord = checkThroughAndFixPalindrome(stringCharacters: StringCharacters)
        } else if StringCharacters[StringCharacters.count - 1] == "?" {
            StringCharacters[StringCharacters.count - 1] = StringCharacters[0]
            finalWord = checkThroughAndFixPalindrome(stringCharacters: StringCharacters)
        } else {
            // NOT A PALINDROME
            finalWord = "NO"
        }
        
    }
    
    return finalWord
}

// TESTS
print(palindromeSolution("?a??"))
