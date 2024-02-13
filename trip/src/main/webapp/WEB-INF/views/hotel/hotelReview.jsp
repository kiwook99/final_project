<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 후기 페이지</title>
<style>
/* 댓글 입력 폼 스타일 */
.comment-form {
  margin-bottom: 20px;
  text-align: center;
}

.comment-form textarea {
  width: 80%;
  height: 100px;
  margin-bottom: 10px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  resize: vertical;
}

.comment-form button {
  padding: 10px 20px;
  background-color: #0AA4B5;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.comment-form button:hover {
  background-color: #0bc5da;
  transition-duration: 0.5s;
}

input{
	margin-bottom: 10px;
}


/* 댓글 목록 스타일 */
.comment-list {
  width: 90%;
  list-style-type: none;
  padding: 0;
}

.comment-list li {
  margin-left: 200px;
  margin-bottom: 10px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.comment-list li:last-child {
  margin-bottom: 0;
}

#delecte {
	
}
</style>
</head>
<body>
<%@ include file="/main.jsp" %>
<div id="root"></div> <!-- 리액트 앱을 렌더링할 컨테이너 -->

    <!-- 리액트 및 바벨 로드 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react/17.0.2/umd/react.production.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react-dom/17.0.2/umd/react-dom.production.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js"></script>
	<script>
	    // memid 값을 JavaScript 변수로 가져오기
	    var memid = "<%= memid %>";
	</script>
    <!-- 댓글 작성 폼 컴포넌트 -->
    <script type="text/babel">
        class CommentForm extends React.Component {
            constructor(props) {
                super(props);
                this.state = { text: '', memid: '' };
            }

		handleSubmit = async (e) => {
		    e.preventDefault();
	 	   const { text, memid } = this.state; // memid 값도 함께 가져오도록 수정
		    try {
	 	       await fetch('http://192.168.0.4:3001/api/comments', {
 		           method: 'POST',
  	    	       headers: { 'Content-Type': 'application/json' },
 	        	   body: JSON.stringify({ text, memid }), // text와 memid 함께 전송
		       });
 		       this.setState({ text: '', memid: '' }); // 입력 필드 초기화
			   window.location.reload(); //폼 제출 후 새로고침
	 	   } catch (error) {
 		       console.error('Error creating comment:', error);
 	 	  }
		};

            handleChange = (e) => {
                this.setState({ text: e.target.value });
            };

	 	   handleMemidChange = (e) => { // memid 입력값 처리 메서드 추가
   	 	 	   this.setState({ memid: e.target.value });
    	   };

        render() {
        return (
            <div className="comment-form">
                <form id="commentForm" onSubmit={this.handleSubmit}>
                    <textarea
                        id="commentText"
                        value={this.state.text}
                        onChange={this.handleChange}

                        placeholder="후기를 입력하세요..."
                        required
                    ></textarea>
                    <br />
                    {/* memid 입력 필드 */}
                    <input
                        type="text"
                        value={this.state.memid}
                        onChange={this.handleMemidChange}
                        placeholder="작성자 이름"
                        required
                    />
                    <br />
                    <button type="submit">후기 작성</button>
                </form>
            </div>
                );
            }
        }
    </script>

    <!-- 댓글 목록 컴포넌트 -->
    <script type="text/babel">
        class CommentList extends React.Component {
            constructor(props) {
                super(props);
                this.state = { comments: [] };
            }

            componentDidMount() {
                this.fetchComments();
            }

            fetchComments = async () => {
                try {
                    const response = await fetch('http://192.168.0.4:3001/api/comments');
                    const comments = await response.json();
                    this.setState({ comments });
                } catch (error) {
                    console.error('Error fetching comments:', error);
                }
            };

		   handleDelete = async (_id) => {
  			  try {
     			   await fetch('http://192.168.0.4:3001/api/comments/delete', {
      			      method: 'POST',
					  headers: { 'Content-Type': 'application/json' },
 	        	      body: JSON.stringify({ _id, memid}),
    			    });
     			   // 댓글 목록을 다시 가져와서 화면 갱신
      			  this.fetchComments();
   			  } catch (error) {
   			    console.error('Error deleting comment:', error);
  			  }
			};

            render() {
                return (
                    <div class="comment-list">
                        <h2 class="comment-list"></h2>
                        <ul id="commentList">
                            {this.state.comments.map((comment, index) => (
                                <li key={index}>
                            		<div id="com_list">
										 {comment.text}
           								 <h4>작성자: {comment.memid}</h4>  
           								 <input type="hidden" value={comment._id} />
            							 <button onClick={() => this.handleDelete(comment._id)}>삭제</button>
										 </div>
								</li>
                            ))}
                        </ul>
                    </div>
                );
            }
        }
    </script>

    <!-- 댓글 작성 폼과 목록을 렌더링 -->
    <script type="text/babel">
        ReactDOM.render(
            <div>
                <h1>숙소 후기 페이지</h1>
                <CommentForm />
                <CommentList />
            </div>,
            document.getElementById('root')
        );
    </script>
</body>
</html>
