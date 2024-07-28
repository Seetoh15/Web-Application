<%@ Page Title="" Language="C#" MasterPageFile="~/Educator/template.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="WAPP_Assignment.Educator.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Create New Quiz</title>
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
        }
        .choices-container {
            margin-top: 10px;
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
                        <input type="text" name="questionText" placeholder="Enter question" class="form-control" />
                        <div class="choices-container">
                            <div class="choice-group">
                                <input type="text" name="choiceText" placeholder="Enter choice" class="form-control" />
                                <input type="radio" name="isCorrect" value="0" />
                                <label>Correct</label>
                            </div>
                            <div class="choice-group">
                                <input type="text" name="choiceText" placeholder="Enter choice" class="form-control" />
                                <input type="radio" name="isCorrect" value="1" />
                                <label>Correct</label>
                            </div>
                            <div class="choice-group">
                                <input type="text" name="choiceText" placeholder="Enter choice" class="form-control" />
                                <input type="radio" name="isCorrect" value="2" />
                                <label>Correct</label>
                            </div>
                            <div class="choice-group">
                                <input type="text" name="choiceText" placeholder="Enter choice" class="form-control" />
                                <input type="radio" name="isCorrect" value="3" />
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
    <link rel="stylesheet" href="test.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <button id="popupBtn">Add Post</button>
    <div class="form-container">
        <h2>Create New Quiz</h2>
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
            <!-- Questions will be dynamically added here -->
        </div>
        <div class="form-group">
            <button type="button" id="addQuestionBtn" class="form-control">Add Question</button>
        </div>
        <div class="form-group">
            <asp:Button ID="SubmitButton" runat="server" Text="Create Quiz" OnClick="SubmitButton_Click" CssClass="form-control" />
        </div>
    </div>
    <div id="popup" class="popup">
        <div class="popup-content">
            <span class="close">&times;</span>
            <h2>Upload Learning Material</h2>
            <div class="form-group">
                <asp:TextBox ID="txtTopic" runat="server" Placeholder="Topic" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Upload pdf:"></asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control-file" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
    <script src="test.js"></script>
</asp:Content>
