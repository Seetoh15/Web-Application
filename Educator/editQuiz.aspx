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
            background: white;
        }
        .form-group {
            margin-bottom: 40px;
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
        .editQuestionBtn {
            background-color: orange;
            color: white;
            border: none;
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 10px;
        }
        
        /* The popup background */
        .popup {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Popup content */
        .popup-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 60%; /* Could be more or less, depending on screen size */
        }

        /* The close button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            text-align: center;
        }

            .btn:hover {
                background-color: #0056b3;
            }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .btnRemove {
            float: right;
            margin-bottom: 10px;
            padding: 10px;
            background: red;
            color: white;
            border: none;
            border-radius: 4px;
            margin-left: 10px;
        }
    </style>
    <script>
        function confirmPostDeletion() {
            return confirm("Are you sure you want to delete this quiz?");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2>Edit Quiz</h2>
        <div class="form-group">
            <div style="display:flex; flex-direction:row; justify-content:space-between; margin-bottom:10px; align-items:center;">
                <label for="QuizTitle">Quiz Title</label>
                <asp:Button ID="Button1" runat="server" Text="Save Title" style="padding:10px 15px; width:115px; border:none; color:white; background:#007bff; cursor:pointer;" OnClick="Button1_Click" />
            </div>
            <asp:TextBox ID="QuizTitle" runat="server" placeholder="Enter quiz title"></asp:TextBox>
        </div>
        <div class="questions-container" id="questionsContainer">
            <div style="display:flex; flex-direction:row; align-items:center;">
                <h3 style="width:70%;">Questions</h3>
                <div class="form-group" style="text-align:right; width:30%;">
                    <button type="button" id="addQuestionBtn" style="width:115px;">Add Question</button>
                </div>
            </div>
            <asp:Repeater ID="QuestionsRepeater" runat="server" OnItemDataBound="QuestionsRepeater_ItemDataBound">
                <ItemTemplate>
                    <div class="question-group">
                        <asp:HiddenField ID="QuestionId" runat="server" Value='<%# Eval("question_id") %>' />
                        <input type="text" name="questionText" value='<%# Eval("question_text") %>' readonly />
                        <div class="choices-container">
                            <asp:Repeater ID="ChoicesRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="choice-group">
                                        <asp:HiddenField ID="ChoiceId" runat="server" Value='<%# Eval("choice_id") %>' />
                                        <input type="text" name="choiceText" value='<%# Eval("choice_text") %>' readonly />
                                        <input type="radio" name="<%# Eval("question_id") %>" <%# Convert.ToBoolean(Eval("is_correct")) ? "checked" : "" %> disabled />
                                        <label>Correct</label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <a href="editQuestion.aspx?question_id=<%# Eval("question_id") %>" style="text-decoration:none;"><button type="button" class="editQuestionBtn">Edit Question</button></a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <%--<div class="form-group">
            <asp:Button ID="SaveButton" runat="server" Text="Save Changes" OnClick="SaveButton_Click" CssClass="form-control" />
        </div>--%>
    </div>

    <div id="popup" class="popup">
        <div class="popup-content">
            <span class="close">&times;</span>
            <h2>Add Question</h2>
            <div class="form-group">
                <asp:TextBox ID="txtQuestion" runat="server" Placeholder="Question" CssClass="form-control"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title is required!" ControlToValidate="txtTitle" CssClass="error-message"></asp:RequiredFieldValidator>--%>
            </div>
            <div style="display:flex; flex-direction:column; margin-bottom:15px; gap:10px;">
                <div>
                    <asp:TextBox ID="TextBox1" runat="server" Placeholder="Option 1" CssClass="form-control"></asp:TextBox>
                    <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="choice" />
                    <asp:Label ID="Label1" runat="server" Text="Correct"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="TextBox2" runat="server" Placeholder="Option 2" CssClass="form-control"></asp:TextBox>
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="choice" />
                    <asp:Label ID="Label2" runat="server" Text="Correct"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="TextBox3" runat="server" Placeholder="Option 3" CssClass="form-control"></asp:TextBox>
                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="choice" />
                    <asp:Label ID="Label3" runat="server" Text="Correct"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="TextBox4" runat="server" Placeholder="Option 4" CssClass="form-control"></asp:TextBox>
                    <asp:RadioButton ID="RadioButton4" runat="server" GroupName="choice" />
                    <asp:Label ID="Label4" runat="server" Text="Correct"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>

    <script src="editQuiz.js"></script>
</asp:Content>
