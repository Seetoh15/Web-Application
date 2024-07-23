<%@ Page Title="" Language="C#" MasterPageFile="~/Member/template.Master" AutoEventWireup="true" CodeBehind="englishQuiz.aspx.cs" Inherits="WAPP_Assignment.Member.englishQuiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>English Quiz</title>
    <link rel="stylesheet" href="engQuiz.css" />
    <script src="engQuiz.js" defer></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="centered-form">
        <h1>1. What is the synonym of the word "happy"?</h1><br>
        <input type="radio" id="1A" value="Sad" name="1">
        <label for="1A">Sad</label><br>
        <input type="radio" id="1B" value="Joyful" name="1">
        <label for="1B">Joyful</label><br>
        <input type="radio" id="1C" value="Angry" name="1">
        <label for="1C">Angry</label><br>
        <input type="radio" id="1D" value="Tired" name="1">
        <label for="1D">Tired</label><br><br><br>

        <h1>2. Which of the following is a verb?</h1><br>
        <input type="radio" id="2A" value="Beautiful" name="2">
        <label for="2A">Beautiful</label><br>
        <input type="radio" id="2B" value="Quickly" name="2">
        <label for="2B">Quickly</label><br>
        <input type="radio" id="2C" value="Run" name="2">
        <label for="2C">Run</label><br>
        <input type="radio" id="2D" value="Blue" name="2">
        <label for="2D">Blue</label><br><br><br>

        <h1>3. What is the correct past tense of the verb "go"?</h1><br>
        <input type="radio" id="3A" value="Go" name="3">
        <label for="3A">Go</label><br>
        <input type="radio" id="3B" value="Went" name="3">
        <label for="3B">Went</label><br>
        <input type="radio" id="3C" value="Going" name="3">
        <label for="3C">Going</label><br>
        <input type="radio" id="3D" value="Gone" name="3">
        <label for="3D">Gone</label><br><br><br>

        <h1>4. Which sentence is in the passive voice?</h1><br>
        <input type="radio" id="4A" value="The cat chased the mouse." name="4">
        <label for="4A">The cat chased the mouse.</label><br>
        <input type="radio" id="4B" value="The mouse was chased by the cat." name="4">
        <label for="4B">The mouse was chased by the cat.</label><br>
        <input type="radio" id="4C" value="The cat is chasing the mouse." name="4">
        <label for="4C">The cat is chasing the mouse.</label><br>
        <input type="radio" id="4D" value="The mouse will chase the cat." name="4">
        <label for="4D">The mouse will chase the cat.</label><br><br><br>

        <h1>5. What is the antonym of the word "ancient"?</h1><br>
        <input type="radio" id="5A" value="Old" name="5">
        <label for="5A">Old</label><br>
        <input type="radio" id="5B" value="Antique" name="5">
        <label for="5B">Antique</label><br>
        <input type="radio" id="5C" value="Modern" name="5">
        <label for="5C">Modern</label><br>
        <input type="radio" id="5D" value="Historic" name="5">
        <label for="5D">Historic</label><br><br><br>

        <h1>6. Which of the following is a compound sentence?</h1><br>
        <input type="radio" id="6A" value="I went to the store." name="6">
        <label for="6A">I went to the store.</label><br>
        <input type="radio" id="6B" value="I went to the store, and I bought some milk." name="6">
        <label for="6B">I went to the store, and I bought some milk.</label><br>
        <input type="radio" id="6C" value="While I was at the store, I saw a friend." name="6">
        <label for="6C">While I was at the store, I saw a friend.</label><br>
        <input type="radio" id="6D" value="The store was closed." name="6">
        <label for="6D">The store was closed.</label><br><br><br>

        <h1>7. Which word is an adjective in the sentence: "The quick brown fox jumps over the lazy dog"?</h1><br>
        <input type="radio" id="7A" value="Quick" name="7">
        <label for="7A">Quick</label><br>
        <input type="radio" id="7B" value="Jumps" name="7">
        <label for="7B">Jumps</label><br>
        <input type="radio" id="7C" value="Fox" name="7">
        <label for="7C">Fox</label><br>
        <input type="radio" id="7D" value="Over" name="7">
        <label for="7D">Over</label><br><br><br>

        <h1>8. Which of the following sentences uses correct punctuation?</h1><br>
        <input type="radio" id="8A" value="Its raining outside." name="8">
        <label for="8A">Its raining outside.</label><br>
        <input type="radio" id="8B" value="It's raining outside." name="8">
        <label for="8B">It's raining outside.</label><br>
        <input type="radio" id="8C" value="Its' raining outside." name="8">
        <label for="8C">Its' raining outside.</label><br>
        <input type="radio" id="8D" value="Its raining, outside." name="8">
        <label for="8D">Its raining, outside.</label><br><br><br>

        <h1>9. Which of the following is a homophone?</h1><br>
        <input type="radio" id="9A" value="Bear (animal) and Bare (exposed)" name="9">
        <label for="9A">Bear (animal) and Bare (exposed)</label><br>
        <input type="radio" id="9B" value="Right (correct) and Write (to mark)" name="9">
        <label for="9B">Right (correct) and Write (to mark)</label><br>
        <input type="radio" id="9C" value="Flour (ingredient) and Flower (plant)" name="9">
        <label for="9C">Flour (ingredient) and Flower (plant)</label><br>
        <input type="radio" id="9D" value="All of the above" name="9">
        <label for="9D">All of the above</label><br><br><br>

        <h1>10. Which sentence is grammatically correct?</h1><br>
        <input type="radio" id="10A" value="She don't like to read." name="10">
        <label for="10A">She don't like to read.</label><br>
        <input type="radio" id="10B" value="She doesn't like to read." name="10">
        <label for="10B">She doesn't like to read.</label><br>
        <input type="radio" id="10C" value="She don't likes to read." name="10">
        <label for="10C">She don't likes to read.</label><br>
        <input type="radio" id="10D" value="She doesn't likes to read." name="10">
        <label for="10D">She doesn't likes to read.</label><br><br>

        <input type="submit" value="Submit" id="submitQuizForm">
        <br>
        <p id="percentageDisplay"></p>
        <br>
    </div>
</asp:Content>
