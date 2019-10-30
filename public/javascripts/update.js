function update_tasks(task)
{
  var xhr = new XMLHttpRequest();
  xhr.open("PATCH", '/tasks', true);
  xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  params = `task_id= ${task.value}`
  xhr.send(params);

}

function delete_task(link)
{
  var xhr = new XMLHttpRequest();
  var link_uri = link.attributes["href"];
  var task_id = link_uri.textContent.match(/\d+/i)[0];
  // alert(task_id)
  xhr.open("DELETE", `/tasks/${task_id}`, true);
  xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  params = `task_id=${task_id}`
  xhr.send(params);
  location.reload();
}

// window.onload = function ()
// {
//   tasks = document.getElementsByClassName('task');
//   function update_tasks()
//   {
//     btn = document.getElementById("update_task_btn");
//
//     alert(btn.click());
//   }
//
//
//   checks = [];
//   for (i = 0; i < tasks.length; i++)
//   {
//     checks.push(tasks[i].children[0].children[0]);
//   }
//
//   for (task_id = 0; task_id < tasks.length; task_id++) {
//     // checks[task_id].addEventListener("click", update_tasks);
//       // checks[task_id].addEventListener("click", update_tasks);
//
//   }
//
//
// }
