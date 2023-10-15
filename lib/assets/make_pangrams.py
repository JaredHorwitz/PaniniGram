def make():
    pangrams = {}   #Set<Chars>: List<Strings>
    with open('words.txt', 'r') as f:
        lines = f.readlines()
        for word in lines:
            word = word.strip()
            sword = set(word)
            if len(sword) == 7:
                sword_str = str(sword)
                print(f'pangram: {word}, sword: {sword_str}')
                if (sword_str in pangrams):
                    pangrams[sword_str].append(word)
                else:
                    pangrams[sword_str] = [word]

    # print(pangrams)

    with open('pangrams.txt', 'w') as f:
        for sword, words in pangrams.items():
            wordstring = ''
            for word in words:
                wordstring += f'{word},'
            wordstring = wordstring[:-1]

            f.write(f'{wordstring}\n')

if __name__ == '__main__':
    make()