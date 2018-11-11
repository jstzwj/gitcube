use std::collections::HashMap;

use uuid::Uuid;

use actix_web::{Form, Path, HttpRequest, HttpResponse};
use actix_web::middleware::session::{RequestSession};

use ::TERA;
use ::AppEnv;
use super::session_to_context;

use ::models::org::Org;
use ::models::org::insert_org;

use ::git::repo::git_init;

pub fn new_organization_page(req: &HttpRequest<AppEnv>) -> HttpResponse {
    let context = session_to_context(&req.session());
    let contents = TERA.render("new_organization.html", &context).unwrap();
    HttpResponse::Ok().body(&contents)
}

pub fn new_organization_action((req, form): (HttpRequest<AppEnv>, Form<HashMap<String, String>>)) -> HttpResponse {
    let state = req.state();
    if form.contains_key("org_name")
        && form.contains_key("description"){
        let uuid = req.session().get::<String>("uuid").unwrap().unwrap();
        let user_fullname = req.session().get::<String>("user_fullname").unwrap().unwrap();
        let context = session_to_context(&req.session());
        // insert to db
        let org_uuid = Uuid::new_v4().to_hyphenated().to_string();
        insert_org(&state.connection, &Org{
            uuid:org_uuid.clone(),
            name:form["org_name"].clone(), 
            description:form["description"].clone()
        });
        HttpResponse::Found().header("Location", format!("/{}/{}",&user_fullname, &form["org_name"])).finish()
    }else{
        HttpResponse::BadRequest().finish()
    }
}
/*
pub fn repo_page((req, path): (HttpRequest<AppEnv>, Path<(String,String)>)) -> HttpResponse {
    let state = req.state();
    let repo_opt = find_repo_by_username_reponame(&state.connection, &path.0, &path.1);

    if repo_opt.is_none(){
        return HttpResponse::BadRequest().finish();
    }
    
    let mut context = session_to_context(&req.session());
    context.insert("cur_user_fullname", &path.0);
    context.insert("cur_repo_name", &path.1);
    let contents = TERA.render("repository.html", &context).unwrap();
    HttpResponse::Ok().body(&contents)
}
*/