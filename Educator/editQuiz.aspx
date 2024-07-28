<%@ Page Title="" Language="C#" MasterPageFile="~/Educator/template.Master" AutoEventWireup="true" CodeBehind="editQuiz.aspx.cs" Inherits="WAPP_Assignment.Educator.editQuiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Edit Quiz</title>
    <style>
        .form-container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group button {
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        .questions-container {
            margin-top: 20px;
        }
        .question-group {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            position: relative;
        }
        .choices-container {
            margin-top: 10px;
        }
        .removeQuestionBtn, .removeChoiceBtn {
            background-color: red;
            color: white;
            border: none;
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .removeChoiceBtn {
            top: unset;
            bottom: 10px;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var addQuestionBtn = document.getElementById('addQuestionBtn');
            var questionsContainer = document.getElementById('questionsContainer');

            addQuestionBtn.addEventListener('click', function () {
                var questionGroup = document.createElement('div');
                questionGroup.className = 'question-group';
                questionGroup.innerHTML = `
                    <div>
                        <input type="text" name="newQuestionText" placeholder="Enter question" class="form-control" />
                        <div class="choices-container">
                            <div class="choice-group">
                                <input type="text" name="newChoiceText" placeholder="Enter choice" class="form-control" />
                                <input type="radio" name="newIsCorrect" value="0" />
                                <label>Correct</label>
                            </div>
                            <div class="choice-group">
                                <input type="text" name="newChoiceText" placeholder="Enter choice" class="form-control" />
                                <input type="radio" name="newIsCorrect" value="1" />
                                <label>Correct</label>
                            </div>
                            <div class="choice-group">
                                <input type="text" name="newChoiceText" placeholder="Enter choice" class="form-control" />
                                <input type="radio" name="newIsCorrect" value="2" />
                                <label>Correct</label>
                            </div>
                            <div class="choice-group">
                                <input type="text" name="newChoiceText" placeholder="Enter choice" class="form-control" />
                                <input type="radio" name="newIsCorrect" value="3" />
                                <label>Correct</label>
                            </div>
                        </div>
                        <button type="button" class="removeQuestionBtn">Remove Question</button>
                    </div>
                `;
                questionsContainer.appendChild(questionGroup);

                var removeQuestionBtns = document.querySelectorAll('.removeQuestionBtn');
                removeQuestionBtns.forEach(function (btn) {
                    btn.addEventListener('click', function () {
                        btn.parentElement.remove();
                    });
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2>Edit Quiz</h2>
        <div class="form-group">
            <label for="QuizTitle">Quiz Title</label>
            <asp:TextBox ID="QuizTitle" runat="server" CssClass="form-control" placeholder="Enter quiz title"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="QuizDescription">Description</label>
            <asp:TextBox ID="QuizDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Enter quiz description"></asp:TextBox>
        </div>
        <div class="questions-container" id="questionsContainer">
            <h3>Questions</h3>
            <asp:Repeater ID="QuestionsRepeater" runat="server" OnItemDataBound="QuestionsRepeater_ItemDataBound">
                <ItemTemplate>
                    <div class="question-group">
                        <asp:HiddenField ID="QuestionId" runat="server" Value='<%# Eval("question_id") %>' />
                        <input type="text" name="questionText" value='<%# Eval("question_text") %>' class="form-control" />
                        <div class="choices-container">
                            <asp:Repeater ID="ChoicesRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="choice-group">
                                        <asp:HiddenField ID="ChoiceId" runat="server" Value='<%# Eval("choice_id") %>' />
                                        <input type="text" name="choiceText" value='<%# Eval("choice_text") %>' class="form-control" />
                                        <input type="radio" name="isCorrect" value='<%# Eval("choice_id") %>' <%# Convert.ToBoolean(Eval("is_correct")) ? "checked" : "" %> />
                                        <label>Correct</label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <button type="button" class="removeQuestionBtn">Remove Question</button>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="form-group">
            <button type="button" id="addQuestionBtn" class="form-control">Add Question</button>
        </div>
        <div class="form-group">
            <asp:Button ID="SaveButton" runat="server" Text="Save Changes" OnClick="SaveButton_Click" CssClass="form-control" />
        </div>
    </div>
</asp:Content>
