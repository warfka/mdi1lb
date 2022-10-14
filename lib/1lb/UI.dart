public string Encrypt(string input)
{
  for (int i = 0; i < input.Length % key.Length; i++)
    input += input[i];

  string result = "";

  for (int i = 0; i < input.Length; i += key.Length)
  {
    char[] transposition = new char[key.Length];

    for (int j = 0; j < key.Length; j++)
      transposition[key[j] - 1] = input[i + j];

    for (int j = 0; j < key.Length; j++)
      result += transposition[j];
  }

  return result;
}